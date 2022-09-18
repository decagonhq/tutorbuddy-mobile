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
}


