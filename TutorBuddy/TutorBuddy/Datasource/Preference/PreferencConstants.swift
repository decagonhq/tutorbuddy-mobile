//
//  PreferencConstants.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation

struct PreferenceConstants {
    static let ACCESS_TOKEN = "AccessToken"
    static let HAS_ONBOARDED = "HasOnboarded"
    static let USER = "ACUser"
    static let LANGUAGE = "SelectedLanguage"
    static let NEW_LOAN_APPLICATION_SUBMITTED = "NewLoanApplicationSubmitted"
    static let COUNTRY = "CurrentCountry"
}

enum PreferenceKey: String {
    case carDetailsUpdated, carMediaUploaded, carListedOrDelisted, newInspectionRequestCreated
}
