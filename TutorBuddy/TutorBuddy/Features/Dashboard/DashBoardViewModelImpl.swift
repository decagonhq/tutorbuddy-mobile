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
    var recommendedSubjects = [RecommendedSubject]()
    fileprivate let authRemote: IAuthRemoteDatasource
    var showRecommendedSubjects = PublishSubject<Bool>()
    var showAllCoursesCategories = PublishSubject<Bool>()
    var allCoursesCategories = [RecommendedSubjectCategory]()
    fileprivate let dashboardRemote: IDashboardRemoteDatasource
    fileprivate let commonRemote: ICommonRequestsRemoteDatasource
    var noFeaturedTutorsMessage: String = .NO_FEATURED_TUTORS_FOUND
    var selectedRecommendedCourse: RecommendedSubject? = nil
    var recommendedSubjectDetailsData = PublishSubject<RecommendedSubjectDetailsData>()
    var tutorComments = PublishSubject<[String?]>()
    var showTutorComments = PublishSubject<Bool>()
    
    
    init(preference:IPreference, dashboardRemote: IDashboardRemoteDatasource, authRemote: IAuthRemoteDatasource, commonRemote: ICommonRequestsRemoteDatasource) {
        self.preference =  preference
        self.dashboardRemote = dashboardRemote
        self.authRemote = authRemote
        self.commonRemote = commonRemote
    }
    
    func getUserDetails() {
        subscribe(dashboardRemote.getUserDetails(id: preference.userID), success: { [weak self] res in
            self?.preference.user = res.data
            self?.userName.onNext((res.data?.firstName ?? "John") + " " + (res.data?.lastName ?? "Doe"))
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
                self?.userUpdated.onNext(true)
                self?.showMessage("User updated successfully.", type: .success)
            })
        }
    }
    
    func getFeaturedTutors(params: Parameters) {
        subscribe(dashboardRemote.getFeaturedTutors(params: params), success: { [weak self] featuredTutorsRes in
            self?.featuredTutors = featuredTutorsRes.data ?? []
            self?.showFeaturedTutors.onNext(true)
        })
    }
    
    func getAllRecommendedSubjects(params: Parameters) {
        subscribe(dashboardRemote.getAllRecommendedSubjects(params: params), success: { [weak self] recommendedSubjectsRes in
            self?.recommendedSubjects = recommendedSubjectsRes.data?.pageItems ?? []
            self?.showRecommendedSubjects.onNext(true)
        })
    }
    
    func getAllCoursesCategories(params: Parameters) {
        let params: Parameters = [
            "pageSize": 10000,
            "pageNumber": 1
        ]
        subscribe(dashboardRemote.getAllCoursesCategories(params: params), success: { [weak self] allCoursesCategoriesRes in
            self?.allCoursesCategories = allCoursesCategoriesRes.data?.pageItems ?? []
            self?.showAllCoursesCategories.onNext(true)
        })
    }
    
    func getRecommendedCourseDetails() {
        guard let tutorSubjectId = selectedRecommendedCourse?.tutorSubjectId else {
            showMessage(.NO_DATA_FOUND, type: .error)
            return
        }
        subscribe(dashboardRemote.getRecommendedCourseDetails(tutorSubjectId: tutorSubjectId), success: { [weak self] courseDetailsRes in
            if let _data = courseDetailsRes.data {
                with(_data) {
                    self?.recommendedSubjectDetailsData.onNext(RecommendedSubjectDetailsData(
                        topic: $0.topic,
                        thumbnail: $0.thumbnail,
                        description: $0.description,
                        name: $0.name,
                        avatar: $0.avatar,
                        bioNote: $0.bioNote,
                        unitOfPrice: $0.unitOfPrice,
                        createdAt: $0.createdAt,
                        rating: $0.rating,
                        noOfCourses: $0.noOfCourses,
                        price: $0.price,
                        tutorComments: $0.tutorComments))
                    self?.tutorComments.onNext($0.tutorComments ?? [])
                }
            }
        })
    }
    
    fileprivate func refreshToken() {
        let params: Parameters = [
            "userId": self.preference.userID,
            "refreshToken": self.preference.refreshToken
        ]
        subscribe(commonRemote.refreshToken(params: params), success: { [weak self] refreshTokenRes in
            self?.preference.accessToken = refreshTokenRes.data?.newAccessToken.orEmpty ?? ""
            self?.preference.refreshToken = refreshTokenRes.data?.newRefreshToken.orEmpty ?? ""
        })
    }
}
