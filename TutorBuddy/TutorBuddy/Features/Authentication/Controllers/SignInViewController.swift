//
//  SignInViewController.swift
//  TutorBuddy
//

import UIKit
import AuthenticationServices

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
            
            $0.signinWithAppleTapHandler = { [weak self] in
                let provider = ASAuthorizationAppleIDProvider()
                let request = provider.createRequest()
                request.requestedScopes = [.fullName, .email]
                
                let controller = ASAuthorizationController(authorizationRequests: [request])
                controller.delegate = self
                controller.presentationContextProvider = self
                controller.performRequests()
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
            if route == .studentDashboard {
                self?.setViewControllers(using: TBDashBoardViewController())
            } else if route == .tutorDashboard {
                self?.setViewControllers(using: TBTutorDashboardViewController())
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeAuthErrorMessage() {
        viewModel.authErrorMessage.bind { message in
            self.showDialog(for: SignInErrorViewController().apply { $0.messageText = message })
        }.disposed(by: disposeBag)
    }

}

extension SignInViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        _print("Sign in with Apple failed", .error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            let firstName = credentials.fullName?.givenName
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            _print(firstName, .success)
            break
        default:
            break
        }
    }
}
