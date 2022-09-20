//
//  DashboardRemoteDatasourceImpl.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 04/09/2022.
//

import Foundation
import RxSwift
import Alamofire

class DashboardRemoteDatasourceImpl: BaseRemoteDatasource, IDashboardRemoteDatasource {
    
    func getUserDetails(id: String) -> Observable<TBUserResponse> {
        makeAPIRequest(path: .user(id), responseType: TBUserResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
    func getFeaturedTutors(params: Parameters) -> Observable<TBFeaturedTutorsResponse> {
        makeAPIRequest(path: .featuredTutors, responseType: TBFeaturedTutorsResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
    func getAllRecommendedSubjects(params: Parameters) -> Observable<TBRecommendedSubjectsResponse> {
        makeAPIRequest(path: .recommendedSubjects, responseType: TBRecommendedSubjectsResponse.self, params: params, encoding: URLEncoding.default, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
    func getAllCoursesCategories(params: Parameters) -> Observable<TBRecommendedSubjectCategoryResponse> {
        makeAPIRequest(path: .allSubjectsCategories, responseType: TBRecommendedSubjectCategoryResponse.self, params: params, encoding: URLEncoding.default, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
    func getRecommendedCourseDetails(tutorSubjectId: String) -> Observable<TBRecommendedSubjectDetailsResponse> {
//        makeAPIRequest(path: .recommendedSubjectDetails(tutorSubjectId), responseType: TBRecommendedSubjectDetailsResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
        makeAPIRequest(path: "https://api.tutorbuddy.net/api/Subject/\(tutorSubjectId)", responseType: TBRecommendedSubjectDetailsResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
    func getFeaturedTutorDetails(id: String) -> Observable<TBFeaturedTutorDetailsResponse> {
        makeAPIRequest(path: .featuredTutorDetails(id), responseType: TBFeaturedTutorDetailsResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
    func startSession(params: Parameters) -> Observable<TBSessionStartResponse> {
        makeAPIRequest(path: .session, responseType: TBSessionStartResponse.self, method: .post, params: params)
    }
    
    func getMyCourses(params: Parameters) -> Observable<MyCourseResponse> {
        let userRole = preference.roles.first
        if userRole == .STUDENT {
            return makeAPIRequest(path: .studentSession(preference.userID), responseType: MyCourseResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
        } else {
            return makeAPIRequest(path: .tutorSession(preference.userID), responseType: MyCourseResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
        }
    }
}


