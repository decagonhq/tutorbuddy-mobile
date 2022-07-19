//
//  SignInViewController.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import UIKit

class SignInViewController: BaseViewController<SignInView, IAuthViewModel> {

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        configureNavBar(centerImage: R.image.launch_screen_logo(), barTintColor: .aLabel, tintColor: .aLabel, height: 28)
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        setBackButtonText()
//    }
    
    override func configureViews() {
        super.configureViews()
        kview.do {

//            $0.forgotPasswordTapHandler = { [weak self] in
//                self?._pushViewController(AppDelegate.dependencyContainer.requestOTPController)
//            }

            $0.signinTapHandler = { [weak self] email, password in
                self?.viewModel.signin(email: email, password: password)
            }
            
            $0.createAnAccountTapHandler = { [weak self] in
//                let signupViewController = AppDelegate.dependencyContainer.signUpController
                let welcomeViewController = ViewController()
//                self?.navigationController?.setViewControllers([welcomeViewController, signupViewController], animated: true)
            }
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
        observeAuthErrorMessage()
    }
    
    fileprivate func observeAuthNavRoute() {
//        viewModel.authNavRoute.bind { [weak self] route in
//            if route == .dashboard {
//                self?.setViewControllers(using: NavigationContainerViewController())
//            }
//        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeAuthErrorMessage() {
//        viewModel.authErrorMessage.bind { message in
//            self.showDialog(for: SignInErrorViewController().apply { $0.messageText = message })
//        }.disposed(by: disposeBag)
    }

}
