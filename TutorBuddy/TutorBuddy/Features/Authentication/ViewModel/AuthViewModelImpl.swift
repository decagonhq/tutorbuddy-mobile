//
//  AuthViewModelImpl.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
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
        if preference.user.isNotNil {
            authNavRoute.onNext(.dashboard)
        }
    }
    
    func signin(email: String, password: String) {
        let params = [
            "email": email,
            "password": password
        ]
        subscribe(authRemote.signin(params: params), success: { [weak self] authRes in
            self?.handleAuthenticationResponse(authRes)
        })
    }
    
    fileprivate func handleAuthenticationResponse(_ authRes: AnyStruct) {
//        let roles = authRes.authority?.roles ?? []
//        if roles.isEmpty || !roles.contains(where: { $0.insensitiveEquals("DSA_AGENT") || $0.insensitiveEquals("SALES_OFFICER") }) {
//            authErrorMessage.onNext(.AUTHENTICATION_ROLES_ERROR)
//        } else if authRes.user?.company.isNil ?? false {
//            authErrorMessage.onNext(.AUTHENTICATION_COMPANY_ERROR)
//        } else {
//            preference.user = authRes.user
//            preference.accessToken = authRes.token.orEmpty
//            authNavRoute.onNext(.dashboard)
//        }
    }
    
    func requestOTP(for emailOrPhone: String, navigate: Bool) {
        requestOTPEmailOrPhone = emailOrPhone
        subscribe(authRemote.requestOTP(params: ["payload": emailOrPhone]), success: { [weak self] msgRes in
            if navigate {
                self?.authNavRoute.onNext(.verifyOTP)
            } else {
                self?.showCountdownTimer.onNext(true)
                self?.showMessage("OTP sent successfully")
            }
        })
    }
    
    func verifyOTP(_ otp: String) {
        subscribe(authRemote.verifyOTP(params: ["otp": otp]), success: { [weak self] authRes in
//            self?.preference.user = authRes.user
//            self?.preference.accessToken = authRes.token.orEmpty
            self?.authNavRoute.onNext(.resetPassword)
        })
    }
    
    func resetPassword(to password: String) {
        let params = [
            "password": password,
//            "id": preference.user!.id!,
        ]
        subscribe(authRemote.updatePassword(params: params), success: { [weak self] user in
            self?.preference.user = user
            self?.authNavRoute.onNext(.resetSuccess)
        })
    }
    
}
