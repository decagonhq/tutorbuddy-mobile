//
//  SelectOptionsViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 19/07/2022.
//

import UIKit

class SelectOptionsViewController: BaseViewController<SelectOptionsView, IOnboardingViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.studentOption.animateViewOnTapGesture { [weak self] in
                self?.kview.studentOption.borderColor = .primaryColor
                self?.kview.tutorOption.borderColor = .appBackground
                self?.kview.role = "student"
            }
            
            $0.tutorOption.animateViewOnTapGesture { [weak self] in
                self?.kview.tutorOption.borderColor = .primaryColor
                self?.kview.studentOption.borderColor = .appBackground
                self?.kview.role = "tutor"
            }
            
            $0.exploreButtonHandler = { [weak self] role in
                guard let self = self else { return }
                if role == "student" {
                    self._pushViewController(AppDelegate.dependencyContainer.studentSignUpController)
                } else if role == "tutor" {
                    self._pushViewController(AppDelegate.dependencyContainer.tutorSignUpController)
                } else {
                    self.showMessage("Please select an option to proceed", type: .error)
                }
            }
        }
    }

}
