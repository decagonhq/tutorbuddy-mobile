//
//  IAuthViewModel.swift
//  TutorBuddy
//

import Foundation
import RxSwift

protocol IAuthViewModel {
    
    var authNavRoute: PublishSubject<AuthNavRoute> { get }
    
    var requestOTPEmailOrPhone: String { get set }
    
    var showCountdownTimer: PublishSubject<Bool> { get }
    
    var authErrorMessage: PublishSubject<String> { get }
    
    var subjects: [Subject] { get }
    
    var days: [Day] { get }
    
    var selectedDays: [Day] { get set }
    
    var selectedSubjects: [Subject] { get set }
    
    var showRegisterResources: PublishSubject<Bool> { get }
    
    func signin(email: String, password: String)
    
    func signup(name: String, email: String, password: String, userType: String, bio: String?, selectedSubjects: [Subject]?, selectedDays: [Day]?)
    
    func requestOTP(for emailOrPhone: String, navigate: Bool)
    
    func verifyOTP(_ otp: String, for email: String)
    
    func resetPassword(for: String, from: String, to: String, with: String)
    
    func getRegisterResource(showRegisterResources: Bool)
    
}
