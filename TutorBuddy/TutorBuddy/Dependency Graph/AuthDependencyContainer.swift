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
        
        container.register(StudentSignUpViewController.self) { StudentSignUpViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
        
        container.register(TutorSignUpViewController.self) { TutorSignUpViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
        
        container.register(ForgotPasswordViewController.self) { ForgotPasswordViewController(viewModel: $0.resolve(IAuthViewModel.self)! )}
        
        container.register(CheckMailViewController.self) { CheckMailViewController(viewModel: $0.resolve(IAuthViewModel.self)! )}
    }
    
}
