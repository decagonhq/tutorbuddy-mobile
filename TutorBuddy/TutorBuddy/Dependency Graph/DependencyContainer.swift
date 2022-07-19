//
//  DependencyContainer.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
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

}
