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
    
    @UserDefaultPrimitive(key: PreferenceConstants.NEW_LOAN_APPLICATION_SUBMITTED, default: false)
    var newLoanApplicationSubmitted: Bool
    
    @UserDefaultCodable(key: PreferenceConstants.COUNTRY, default: nil)
    var country: AnyStruct?
    
    @UserDefaultCodable(key: .carDetailsUpdated, default: false)
    var carDetailsUpdated: Bool
    
    @UserDefaultCodable(key: .carMediaUploaded, default: false)
    var carMediaUploaded: Bool
    
    @UserDefaultCodable(key: .carListedOrDelisted, default: false)
    var carListedOrDelisted: Bool
    
    @UserDefaultPrimitive(key: .newInspectionRequestCreated, default: false)
    var newInspectionRequestCreated: Bool
}
