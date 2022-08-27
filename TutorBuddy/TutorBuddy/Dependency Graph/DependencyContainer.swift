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
    
    var signupController: SignUpViewController { resolve(SignUpViewController.self)! }
    
    var resetPasswordController: ResetPasswordViewController { resolve(ResetPasswordViewController.self)! }
    
    var signInController: SignInViewController { resolve(SignInViewController.self)! }
    
    var verifyOTPController: VerifyOTPViewController { resolve(VerifyOTPViewController.self)! }
    
    var selectOptionsController: SelectOptionsViewController { resolve(SelectOptionsViewController.self)! }
    
    var dashBoardController: TBDashBoardViewController { resolve(TBDashBoardViewController.self)! }
    
    var forgotPasswordController: ForgotPasswordViewController { resolve(ForgotPasswordViewController.self)! }
    
    var checkMailController: CheckMailViewController { resolve(CheckMailViewController.self)! }
    
    var dashboardHomeController: HomeViewController { resolve(HomeViewController.self)! }
    
    var allCoursesController: AllCoursesViewController { resolve(AllCoursesViewController.self)! }
    
    var myCoursesController: MyCoursesViewController { resolve(MyCoursesViewController.self)! }
    
    var accountController: AccountViewController { resolve(AccountViewController.self)! }
    
    var courseDetailsController: CourseDetailsViewController { resolve(CourseDetailsViewController.self)! }

}
