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
    
    var dashBoardController: TBDashBoardViewController { resolve(TBDashBoardViewController.self)! }
    
    var forgotPasswordController: ForgotPasswordViewController { resolve(ForgotPasswordViewController.self)! }
    
    var checkMailController: CheckMailViewController { resolve(CheckMailViewController.self)! }
    
    var studentDashboardHomeController: StudentHomeViewController { resolve(StudentHomeViewController.self)! }
    
    var tutorDashboardHomeController: TutorHomeViewController { resolve(TutorHomeViewController.self)! }
    
    var allCoursesController: AllCoursesViewController { resolve(AllCoursesViewController.self)! }
    
    var myCoursesController: MyCoursesViewController { resolve(MyCoursesViewController.self)! }
    
    var studentAccountController: AccountViewController { resolve(AccountViewController.self)! }
    
    var tutorAccountController: TutorAccountViewController { resolve(TutorAccountViewController.self)! }
    
    var notificationsController: NotificationViewController { resolve(NotificationViewController.self)! }
    
    var courseDetailsController: CourseDetailsViewController { resolve(CourseDetailsViewController.self)! }
    
    var editProfileController: EditProfileViewController { resolve(EditProfileViewController.self)! }

}
