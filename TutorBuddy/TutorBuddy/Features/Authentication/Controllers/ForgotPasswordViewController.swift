//
//  ForgotPasswordViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit

class ForgotPasswordViewController: BaseViewController<ForgotPasswordView,IAuthViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.resetPasswordHandler = { [weak self] in
                self?.setViewControllers(using: AppDelegate.dependencyContainer.checkMailController, animate: true)
            }
            
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
        }
    }
}
