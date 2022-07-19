//
//  IAuthViewModel.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import Foundation
import RxSwift

protocol IAuthViewModel {
    
    var authNavRoute: PublishSubject<AuthNavRoute> { get }
    
    var requestOTPEmailOrPhone: String { get set }
    
    var showCountdownTimer: PublishSubject<Bool> { get }
    
    var authErrorMessage: PublishSubject<String> { get }
    
    func signin(email: String, password: String)
    
    func requestOTP(for emailOrPhone: String, navigate: Bool)
    
    func verifyOTP(_ otp: String)
    
    func resetPassword(to password: String)
    
}
