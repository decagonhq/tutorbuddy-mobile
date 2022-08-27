//
//  IPreference.swift
//  TutorBuddy
//

import Foundation

protocol IPreference {
    var accessToken: String { get set }
    
    var userID: String { get set }
    
    var refreshToken: String { get set }
    
    var hasOnboarded: Bool { get set }
    
    var user: AnyStruct? { get set }
    
    var language: Language { get set }
    
    var newLoanApplicationSubmitted: Bool { get set }
    
    var country: AnyStruct? { get set }
    
    var carDetailsUpdated: Bool { get set }
    
    var carMediaUploaded: Bool { get set }
    
    var carListedOrDelisted: Bool { get set }
    
    var newInspectionRequestCreated: Bool { get set }
}
