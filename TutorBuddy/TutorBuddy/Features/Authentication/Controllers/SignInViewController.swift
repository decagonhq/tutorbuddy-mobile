//
//  SignInViewController.swift
//  TutorBuddy
//

import UIKit

class SignInViewController: BaseViewController<SignInView, IAuthViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavBar(false)
    }
    
    override func configureViews() {
        super.configureViews()
        kview.do {

            $0.forgotPasswordTapHandler = { [weak self] in
                self?._pushViewController(AppDelegate.dependencyContainer.forgotPasswordController)
            }

            $0.signinTapHandler = { [weak self] email, password in
                self?.viewModel.signin(email: email, password: password)
            }
            
            $0.createAnAccountTapHandler = { [weak self] in
                self?._pushViewController(AppDelegate.dependencyContainer.signupController, animated: true)
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
            if route == .dashboard {
                self?.setViewControllers(using: TBDashBoardViewController())
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeAuthErrorMessage() {
        viewModel.authErrorMessage.bind { message in
            self.showDialog(for: SignInErrorViewController().apply { $0.messageText = message })
        }.disposed(by: disposeBag)
    }

}
