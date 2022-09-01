//
//  VerifyOTPViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 23/08/2022.
//

import UIKit

class VerifyOTPViewController: BaseViewController<VerifyOTPView, IAuthViewModel> {
    
    var requestOTPEmailOrPhone: String!

    override func configureViews() {
        super.configureViews()
        kview.do {
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
            
            $0.verifyTapHandler = { [weak self] otp in
                guard let self = self else { return }
                self.viewModel.verifyOTP(otp, for: self.requestOTPEmailOrPhone)
            }
            
            $0.resendOTPTapHandler = { [weak self] in
                guard let self = self else { return }
                self.viewModel.requestOTP(for: self.requestOTPEmailOrPhone, navigate: true)
            }
            
        }
        kview.startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        kview.stopTimer()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
        observeShowCountdownTimer()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .signin {
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
