//
//  ForgotPasswordViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit

class ForgotPasswordViewController: BaseViewController<ForgotPasswordView,IAuthViewModel> {
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.nextTapHandler = { [weak self] email in
                self?.viewModel.requestOTP(for: email, navigate: true)
            }
            
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .resetPassword {
                self?._pushViewController(AppDelegate.dependencyContainer.resetPasswordController.apply { $0.email = self?.kview.emailTextfield.text })
            }
        }.disposed(by: disposeBag)
    }
}
