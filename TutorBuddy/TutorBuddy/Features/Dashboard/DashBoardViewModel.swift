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
    
    var showFeaturedTutors: PublishSubject<Bool> { get }
    
    var showRecommendedSubjects: PublishSubject<Bool> { get }
    
    var noFeaturedTutorsMessage: String { get }
    
    func getUserDetails()
    
    func updateUser(with fullName: String, and email: String)
    
    func getFeaturedTutors(params: Parameters)
    
    func getAllRecommendedSubjects(params: Parameters)
}
