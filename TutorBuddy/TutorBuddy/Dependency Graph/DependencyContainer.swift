//
//  DependencyContainer.swift
//  TutorBuddy
//

import Foundation
import Swinject

struct DependencyContainer {
    
    static func configure(using container: Container) {
        CommonDependencyContainer.configure(using: container)
        OnboardingDependencyContainer.configure(using: container)
        AuthDependencyContainer.configure(using: container)
        DashboardDependencyContainer.configure(using: container)
    }
    
}

extension Container {
    var onboardingController: OnboardingViewController { resolve(OnboardingViewController.self)! }
    
    var studentSignUpController: StudentSignUpViewController { resolve(StudentSignUpViewController.self)! }
    
    var tutorSignUpController: TutorSignUpViewController { resolve(TutorSignUpViewController.self)! }
    
    var signInController: SignInViewController { resolve(SignInViewController.self)! }
    
    var selectOptionsController: SelectOptionsViewController { resolve(SelectOptionsViewController.self)! }
    
    var welcomeController: WelcomeViewController { resolve(WelcomeViewController.self)! }
    
    var dashBoardController: TBDashBoardViewController { resolve(TBDashBoardViewController.self)! }

}
