//
//  PreferenceImpl.swift
//  TutorBuddy
//

import Foundation

struct PreferenceImpl: IPreference {
    
    @UserDefaultPrimitive(key: PreferenceConstants.ACCESS_TOKEN, default: "")
    var accessToken: String
    
    @UserDefaultPrimitive(key: PreferenceConstants.USER_ID, default: "")
    var userID: String
    
    @UserDefaultPrimitive(key: PreferenceConstants.REFRESH_TOKEN, default: "")
    var refreshToken: String
    
    @UserDefaultPrimitive(key: PreferenceConstants.ROLES, default: [])
    var roles: [String]
    
    @UserDefaultPrimitive(key: PreferenceConstants.HAS_ONBOARDED, default: false)
    var hasOnboarded: Bool
    
    @UserDefaultCodable(key: PreferenceConstants.USER, default: nil)
    var user: TBUserData?
    
    @UserDefaultCodable(key: PreferenceConstants.LANGUAGE, default: .english)
    var language: Language
    
    @UserDefaultCodable(key: .newFeatureTutorAddedOrRemoved, default: false)
    var newFeatureTutorAddedOrRemoved: Bool
    
    @UserDefaultCodable(key: PreferenceConstants.COUNTRY, default: nil)
    var country: AnyStruct?
}
