//
//  SignUpViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 18/07/2022.
//

import UIKit

class StudentSignUpViewController: BaseViewController<StudentSignUpView, IAuthViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
        }
    }

}
