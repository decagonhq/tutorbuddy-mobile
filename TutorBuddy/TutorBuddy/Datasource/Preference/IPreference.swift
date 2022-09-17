//
//  IPreference.swift
//  TutorBuddy
//

import Foundation

protocol IPreference {
    var accessToken: String { get set }
    
    var userID: String { get set }
    
    var refreshToken: String { get set }
    
    var roles: [String] { get set }
    
    var hasOnboarded: Bool { get set }
    
    var user: TBUserData? { get set }
    
    var language: Language { get set }
    
    var newFeatureTutorAddedOrRemoved: Bool { get set }
    
    var country: AnyStruct? { get set }
}
