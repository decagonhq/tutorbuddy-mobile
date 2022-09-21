//
//  DashBoardViewModel.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import Foundation
import RxSwift
import Alamofire

protocol IDashBoardViewModel {
    
    var userName: BehaviorSubject<String> { get }
    
    var userUpdated: PublishSubject<Bool> { get }
    
    var featuredTutors: [FeaturedTutor] { get }
    
    var recommendedSubjects: [RecommendedSubject] { get }
    
    var allCoursesCategories: [RecommendedSubjectCategory] { get }
    
    var showFeaturedTutors: PublishSubject<Bool> { get }
    
    var showRecommendedSubjects: PublishSubject<Bool> { get }
    
    var showAllCoursesCategories: PublishSubject<Bool> { get }
    
    var noFeaturedTutorsMessage: String { get }
    
    var noRecommendedCoursesMessage: String { get }
    
    var selectedRecommendedCourse: RecommendedSubject? { get set }
    
    var recommendedSubjectDetailsData: PublishSubject<RecommendedSubjectDetailsData> { get }
    
    var tutorComments: PublishSubject<[String?]> { get }
    
    var showTutorComments: PublishSubject<Bool> { get }
    
    var selectedFeatureTutor: FeaturedTutor? { get set }
    
    var featuredTutorDetailsData: PublishSubject<TBFeaturedTutorDetailsData> { get }
    
    var showSessionStarted: PublishSubject<Bool> { get }
    
    var showMyCourses: PublishSubject<Bool> { get }
    
    var myCourses: [MyCourse] { get }
    
    func getUserDetails()
    
    func updateUser(with fullName: String, and email: String)
    
    func getAllCoursesCategories(params: Parameters)
    
    func getRecommendedCourseDetails()
    
    func getFeaturedTutorDetails()
    
    func getDashboardData()
    
    func engageTutor(from: String, to: String)
    
    func getMyCourses(params: Parameters)
    
}
