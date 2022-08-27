//
//  SignUpViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 18/07/2022.
//

import UIKit

class SignUpViewController: BaseViewController<SignUpView, IAuthViewModel> {
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
            
            $0.loginTapHandler = { [weak self] in
                self?._popViewController()
            }
            
            $0.signupTapHandler = { [weak self] name, email, password, userType in
                self?.viewModel.signup(name: name, email: email, password: password, userType: userType)
            }
            
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
        observeAuthErrorMessage()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .verifyOTP {
                self?._pushViewController(AppDelegate.dependencyContainer.verifyOTPController.apply { $0.requestOTPEmailOrPhone = self?.kview.emailTextfield.text })
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeAuthErrorMessage() {
        viewModel.authErrorMessage.bind { message in
            self.showDialog(for: SignInErrorViewController().apply { $0.messageText = message })
        }.disposed(by: disposeBag)
    }

}
