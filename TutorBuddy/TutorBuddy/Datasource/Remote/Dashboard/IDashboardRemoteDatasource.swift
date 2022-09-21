//
//  IDashboardRemoteDatasource.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 04/09/2022.
//

import Foundation
import RxSwift
import Alamofire

protocol IDashboardRemoteDatasource {
    
    func getUserDetails(id: String) -> Observable<TBUserResponse>
    
    func getFeaturedTutors(params: Parameters) -> Observable<TBFeaturedTutorsResponse>
    
    func getAllRecommendedSubjects(params: Parameters) -> Observable<TBRecommendedSubjectsResponse>
    
    func getAllCoursesCategories(params: Parameters) -> Observable<TBRecommendedSubjectCategoryResponse>
    
    func getRecommendedCourseDetails(tutorSubjectId: String) -> Observable<TBRecommendedSubjectDetailsResponse>
    
    func getFeaturedTutorDetails(id: String) -> Observable<TBFeaturedTutorDetailsResponse>
    
    func startSession(params: Parameters) -> Observable<TBSessionStartResponse>
    
    func getMyCourses(params: Parameters) -> Observable<MyCourseResponse>
}
