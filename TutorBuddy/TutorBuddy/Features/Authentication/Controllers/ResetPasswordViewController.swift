//
//  ResetPasswordViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit

class ResetPasswordViewController: BaseViewController<ResetPasswordView,IAuthViewModel> {
    
    var email: String!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        kview.stopTimer()
    }
    
    override func configureViews() {
        super.configureViews()
        kview.do {
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
            
            $0.resetPasswordHandler = { [weak self] otp, password, newPassword in
                guard let self = self else { return }
                self.viewModel.resetPassword(for: self.email, from: password, to: newPassword, with: otp)
            }
//
//            $0.resendOTPTapHandler = { [weak self] in
//                guard let self = self else { return }
//                self.viewModel.requestOTP(for: self.requestOTPEmailOrPhone, navigate: true)
//            }
            
        }
        kview.startTimer()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
        observeShowCountdownTimer()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .resetSuccess {
                self?.setViewControllers(using: AppDelegate.dependencyContainer.signInController)
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeShowCountdownTimer() {
        viewModel.showCountdownTimer.bind { [weak self] show in
            if show {
                self?.kview.startTimer()
            }
        }.disposed(by: disposeBag)
    }
}
