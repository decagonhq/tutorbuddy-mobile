//
//  WelcomeViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 20/07/2022.
//

import UIKit

class WelcomeViewController: BaseViewController<WelcomeView, IAuthViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.letsGoHandler = {[weak self] in
                self?.setViewControllers(using: AppDelegate.dependencyContainer.dashBoardController)
            }
        }
    }
    

}
