//
//  DashBoardViewModelImp.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import Foundation
import RxSwift
import Alamofire

class DashBoardViewModelImpl: BaseViewModel, IDashBoardViewModel {
    
    var preference: IPreference
    var featuredTutors = [FeaturedTutor]()
    var userUpdated = PublishSubject<Bool>()
    var userName = BehaviorSubject(value: "")
    var showFeaturedTutors = PublishSubject<Bool>()
    fileprivate let authRemote: IAuthRemoteDatasource
    var showRecommendedSubjects = PublishSubject<Bool>()
    var recommendedSubjects = [RecommendedSubject]()
    fileprivate let dashboardRemote: IDashboardRemoteDatasource
    fileprivate let commonRemote: ICommonRequestsRemoteDatasource
    var noFeaturedTutorsMessage: String = .NO_FEATURED_TUTORS_FOUND
    
    
    init(preference:IPreference, dashboardRemote: IDashboardRemoteDatasource, authRemote: IAuthRemoteDatasource, commonRemote: ICommonRequestsRemoteDatasource) {
        self.preference =  preference
        self.dashboardRemote = dashboardRemote
        self.authRemote = authRemote
        self.commonRemote = commonRemote
    }
    
    func getUserDetails() {
        subscribe(dashboardRemote.getUserDetails(id: preference.userID), errorMessage: .NO_DATA_FOUND, success: { [weak self] res in
            if res.success == true && res.data.isNotNil {
                self?.preference.user = res.data
                self?.userName.onNext((res.data?.firstName ?? "John") + " " + (res.data?.lastName ?? "Doe"))
            } else {
                self?.showMessage(.AN_ERROR_OCCURRED_TRY_AGAIN, type: .error)
            }
        }, error: { [weak self] error in
            guard let self = self else { return }
            self.showMessage(error.localizedDescription, type: .error)
        })
    }
    
    func updateUser(with fullName: String, and email: String) {
        var components = fullName.components(separatedBy: " ")
        if components.count > 0 {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            let params: Parameters = [
                "firstName": firstName,
                "lastName": lastName,
                "email": email
            ]
            subscribe(authRemote.updateUser(params: params), success: { [weak self] res in
                if res.success == true && res.data?.isEmpty == false {
                    self?.userUpdated.onNext(true)
                    self?.showMessage("User updated successfully.", type: .success)
                }
            }, error: { [weak self] error in
                self?.showMessage(error.localizedDescription, type: .error)
            })
        }
    }
    
    func getFeaturedTutors(params: Parameters) {
        subscribe(dashboardRemote.getFeaturedTutors(params: params), errorMessage: .NO_DATA_FOUND, success: { [weak self] featuredTutorsRes in
            if featuredTutorsRes.success == true && featuredTutorsRes.data.isNotNil {
                self?.featuredTutors = featuredTutorsRes.data ?? []
                self?.showFeaturedTutors.onNext(true)
            } else {
                self?.showMessage(.AN_ERROR_OCCURRED_TRY_AGAIN, type: .error)
            }
        }, error: { [weak self] error in
            self?.showMessage(error.localizedDescription, type: .error)
        })
    }
    
    func getAllRecommendedSubjects(params: Parameters) {
        subscribe(dashboardRemote.getAllRecommendedSubjects(params: params), errorMessage: .NO_DATA_FOUND, success: { [weak self] recommendedSubjectsRes in
            if recommendedSubjectsRes.success == true && recommendedSubjectsRes.data.isNotNil {
                self?.recommendedSubjects = recommendedSubjectsRes.data?.pageItems ?? []
                self?.showRecommendedSubjects.onNext(true)
            } else {
                self?.showMessage(.AN_ERROR_OCCURRED_TRY_AGAIN, type: .error)
            }
        }, error: { [weak self] error in
            self?.showMessage(error.localizedDescription, type: .error)
        })
    }
    
    fileprivate func refreshToken() {
        let params: Parameters = [
            "userId": self.preference.userID,
            "refreshToken": self.preference.refreshToken
        ]
        subscribe(commonRemote.refreshToken(params: params), errorMessage: .NO_DATA_FOUND, success: { [weak self] refreshTokenRes in
            if refreshTokenRes.success == true && refreshTokenRes.data.isNotNil {
                self?.preference.accessToken = refreshTokenRes.data?.newAccessToken.orEmpty ?? ""
                self?.preference.refreshToken = refreshTokenRes.data?.newRefreshToken.orEmpty ?? ""
            }
        })
    }
}
