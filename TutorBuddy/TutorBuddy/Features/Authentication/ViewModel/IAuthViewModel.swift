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
    
    func signin(email: String, password: String)
    
    func signup(name: String, email: String, password: String, userType: String)
    
    func requestOTP(for emailOrPhone: String, navigate: Bool)
    
    func verifyOTP(_ otp: String, for email: String)
    
    func resetPassword(for: String, from: String, to: String, with: String)
    
}
