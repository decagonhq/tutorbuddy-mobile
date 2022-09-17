//
//  PreferencConstants.swift
//  TutorBuddy
//

import Foundation

struct PreferenceConstants {
    static let ACCESS_TOKEN = "AccessToken"
    static let USER_ID = "UserID"
    static let REFRESH_TOKEN = "RefreshToken"
    static let ROLES = "Roles"
    static let HAS_ONBOARDED = "HasOnboarded"
    static let USER = "ACUser"
    static let LANGUAGE = "SelectedLanguage"
    static let NEW_LOAN_APPLICATION_SUBMITTED = "NewLoanApplicationSubmitted"
    static let COUNTRY = "CurrentCountry"
}

enum PreferenceKey: String {
    case newFeatureTutorAddedOrRemoved
}
