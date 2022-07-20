//
//  OnboardingDependencyContainer.swift
//  TutorBuddy
//

import Foundation
import Swinject

struct OnboardingDependencyContainer {
    
    static func configure(using container: Container) {
        container.register(IOnboardingViewModel.self) { OnboardingViewModelImpl(preference: $0.resolve(IPreference.self)!, commonRemote: $0.resolve(ICommonRequestsRemoteDatasource.self)!) }
        
        container.register(OnboardingViewController.self) { OnboardingViewController(viewModel: $0.resolve(IOnboardingViewModel.self)!) }
        
        container.register(SelectOptionsViewController.self) { SelectOptionsViewController(viewModel: $0.resolve(IOnboardingViewModel.self)!) }
        
        container.register(WelcomeViewController.self) { WelcomeViewController(viewModel: $0.resolve(IAuthViewModel.self)!) }
    }
    
}
