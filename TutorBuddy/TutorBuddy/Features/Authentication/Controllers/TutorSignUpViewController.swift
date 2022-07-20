//
//  TutorSignUpViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 19/07/2022.
//

import UIKit

class TutorSignUpViewController: BaseViewController<TutorSignUpView, IAuthViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.backButtonTapHandler = {[weak self] in
                self?._popViewController()
            }
            
            $0.loginTapHandler = { [weak self] in
                self?.setViewControllers(using: AppDelegate.dependencyContainer.signInController, animate: true)
            }
            
            $0.signupTapHandler = { [weak self] name, email, password in
//                viewModel.signup
                self?.setViewControllers(using: AppDelegate.dependencyContainer.welcomeController)
            }
        }
    }
}
