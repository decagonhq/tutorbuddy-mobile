//
//  AuthViewModelImpl.swift
//  TutorBuddy
//

import Foundation
import RxSwift

class AuthViewModelImpl: BaseViewModel, IAuthViewModel {
    
    var authNavRoute: PublishSubject<AuthNavRoute> = PublishSubject()
    var requestOTPEmailOrPhone = ""
    var showCountdownTimer: PublishSubject<Bool> = PublishSubject()
    var authErrorMessage = PublishSubject<String>()
    
    var preference: IPreference
    fileprivate let authRemote: IAuthRemoteDatasource
    
    init(preference: IPreference, authRemote: IAuthRemoteDatasource) {
        self.preference = preference
        self.authRemote = authRemote
    }
    
    override func didAppear() {
        super.didAppear()
        if preference.accessToken.isNotEmpty {
            authNavRoute.onNext(.dashboard)
        }
    }
    
    func signin(email: String, password: String) {
        let params = [
            "emailAddress": email,
            "password": password
        ]
        subscribe(authRemote.signin(params: params), success: { [weak self] authRes in
            self?.handleAuthenticationResponse(authRes)
        })
    }
    
    func signup(name: String, email: String, password: String, userType: String) {
        let fullName = name
        var components = fullName.components(separatedBy: " ")
        if components.count > 0 {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            let params = [
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "password": password,
                "role": userType
            ]
            subscribe(authRemote.signup(params: params), success: { [weak self] authRes in
                if authRes.success == true && authRes.data?.isEmpty == false {
                    self?.preference.userID = authRes.data ?? ""
                    self?.authNavRoute.onNext(.verifyOTP)
                } else {
                    self?.showMessage("an error occured, try again", type: .error)
                }
            }, error: { [weak self] error in
                self?.showMessage("error: \((error as? TBError)?.message ?? "an error occured, try again.")", type: .error)
            })
        }
    }
    
    fileprivate func handleAuthenticationResponse(_ authRes: TBBaseResponse) {
        if authRes.success == true && authRes.data.isNotNil {
            preference.accessToken = authRes.data?.token.orEmpty ?? ""
            preference.userID = authRes.data?.id.orEmpty ?? ""
            preference.refreshToken = authRes.data?.refreshToken.orEmpty ?? ""
            authNavRoute.onNext(.dashboard)
        }
    }
    
    func requestOTP(for emailOrPhone: String, navigate: Bool) {
        requestOTPEmailOrPhone = emailOrPhone
        subscribe(authRemote.requestOTP(params: ["emailAddress": emailOrPhone]), success: { [weak self] msgRes in
            if navigate {
                self?.authNavRoute.onNext(.resetPassword)
            } else {
                self?.showCountdownTimer.onNext(true)
                self?.showMessage("OTP sent successfully")
            }
        })
    }
    
    func verifyOTP(_ otp: String, for email: String) {
        let params = [
            "emailAddress": email,
            "token": otp
        ]
        subscribe(authRemote.verifyOTP(params: params), success: { [weak self] authRes in
            if authRes.success == true && authRes.data?.isEmpty == false {
                self?.preference.userID = authRes.data ?? ""
                self?.authNavRoute.onNext(.dashboard)
            }
        })
    }
    
    func resetPassword(for email: String, from password: String, to newPassword: String, with otp: String) {
        let params = [
            "emailAddress": email,
            "token": otp,
            "newPassword": password,
            "confirmPassword": newPassword
        ]
        subscribe(authRemote.resetPassword(params: params), success: { [weak self] authRes in
            if authRes.success == true && authRes.data?.isEmpty == false {
                self?.authNavRoute.onNext(.resetSuccess)
                self?.showMessage(.RESET_SUCCESSFUL, type: .success)
            }
        }, error: { [weak self] error in
            self?.showMessage("error: make sure otp is correct and try again.", type: .error)
        })
    }
    
}
