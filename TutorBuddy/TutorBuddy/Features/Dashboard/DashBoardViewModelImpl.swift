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
    var myCourses = [MyCourse]()
    var featuredTutors = [FeaturedTutor]()
    var userUpdated = PublishSubject<Bool>()
    var userName = BehaviorSubject(value: "")
    var showMyCourses = PublishSubject<Bool>()
    var showTutorComments = PublishSubject<Bool>()
    var tutorComments = PublishSubject<[String?]>()
    var showFeaturedTutors = PublishSubject<Bool>()
    var selectedFeatureTutor: FeaturedTutor? = nil
    var showSessionStarted = PublishSubject<Bool>()
    var recommendedSubjects = [RecommendedSubject]()
    fileprivate let authRemote: IAuthRemoteDatasource
    var showRecommendedSubjects = PublishSubject<Bool>()
    var showAllCoursesCategories = PublishSubject<Bool>()
    var selectedRecommendedCourse: RecommendedSubject? = nil
    var allCoursesCategories = [RecommendedSubjectCategory]()
    fileprivate let dashboardRemote: IDashboardRemoteDatasource
    fileprivate let commonRemote: ICommonRequestsRemoteDatasource
    var noFeaturedTutorsMessage: String = .NO_FEATURED_TUTORS_FOUND
    var noRecommendedCoursesMessage: String = .NO_RECOMMENDED_COURSES_FOUND
    var recommendedSubjectDetailsData = PublishSubject<RecommendedSubjectDetailsData>()
    var featuredTutorDetailsData = PublishSubject<TBFeaturedTutorDetailsData>()
    
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
                        tutorComments: $0.tutorComments)
                    )
                    self?.tutorComments.onNext($0.tutorComments ?? [])
                }
            }
        })
    }
    
    func getFeaturedTutorDetails() {
        guard let id = selectedFeatureTutor?.id else {
            showMessage(.NO_DATA_FOUND, type: .error)
            return
        }
        subscribe(dashboardRemote.getFeaturedTutorDetails(id: id), success: { [weak self] tutorDetailsRes in
            if let _data = tutorDetailsRes.data {
                with(_data) {
                    self?.featuredTutorDetailsData.onNext(TBFeaturedTutorDetailsData(
                        fullName: $0.fullName,
                        avatar: $0.avatar,
                        bioNote: $0.bioNote,
                        subject: $0.subject,
                        avaliabilities: $0.avaliabilities)
                    )
                }
            }
        })
    }
    
    func getDashboardData() {
        subscribe(
            Observable.zip(
                dashboardRemote.getUserDetails(id: preference.userID),
                dashboardRemote.getFeaturedTutors(params: [:]),
                dashboardRemote.getAllRecommendedSubjects(params: [:])
            ), success: { [weak self] userDetailsRes, featuredTutorsRes, recommendedSubjectsRes in
                self?.preference.user = userDetailsRes.data
                self?.userName.onNext((userDetailsRes.data?.firstName ?? "John") + " " + (userDetailsRes.data?.lastName ?? "Doe"))
                self?.recommendedSubjects = recommendedSubjectsRes.data?.pageItems ?? []
                self?.featuredTutors = featuredTutorsRes.data ?? []
                self?.showFeaturedTutors.onNext(true)
                self?.showRecommendedSubjects.onNext(true)
            }
        )
    }
    
    func engageTutor(from: String, to: String) {
        guard let tutorSubjectId = selectedRecommendedCourse?.tutorSubjectId else { showMessage("ensure you have selected a particular subject.", type: .error); print(selectedRecommendedCourse?.tutorSubjectId); return }
        let params: Parameters = [
            "tutorSubjectId": tutorSubjectId,
            "studentId": preference.userID,
            "startTime": from,
            "endTime": to
        ]
        subscribe(dashboardRemote.startSession(params: params), errorMessage: .AN_ERROR_OCCURRED_TRY_AGAIN, success: { [weak self] startSessionRes in
            if startSessionRes.success == true {
                self?.showSessionStarted.onNext(true)
            } else {
                self?.showMessage(.AN_ERROR_OCCURRED_TRY_AGAIN, type: .error)
            }
        })
    }
    
    func getMyCourses(params: Parameters) {
        let params: Parameters = [
            "pageSize": 10000,
            "pageNumber": 1
        ]
        subscribe(dashboardRemote.getMyCourses(params: params), errorMessage: .NO_DATA_FOUND, success: { [weak self] myCoursesRes in
            self?.myCourses = myCoursesRes.data?.pageItems ?? []
            self?.showMyCourses.onNext(true)
            print(myCoursesRes)
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
