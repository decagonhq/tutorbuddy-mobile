//
//  AuthDependencyContainer.swift
//  TutorBuddy
//

import Foundation
import Swinject

struct AuthDependencyContainer {
    
    static func configure(using container: Container) {
        
        container.register(IAuthRemoteDatasource.self) { _ in AuthRemoteDatasourceImpl() }
        
        container.register(IAuthViewModel.self) { AuthViewModelImpl(preference: $0.resolve(IPreference.self)!, authRemote: $0.resolve(IAuthRemoteDatasource.self)!) }
        
        container.register(SignInViewController.self) { SignInViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
        
        container.register(SignUpViewController.self) { SignUpViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
        
        container.register(VerifyOTPViewController.self) { VerifyOTPViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
        
        container.register(ResetPasswordViewController.self) { ResetPasswordViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
        
        container.register(ForgotPasswordViewController.self) { ForgotPasswordViewController(viewModel: $0.resolve(IAuthViewModel.self)! )}
        
        container.register(CheckMailViewController.self) { CheckMailViewController(viewModel: $0.resolve(IAuthViewModel.self)! )}
    }
    
}
