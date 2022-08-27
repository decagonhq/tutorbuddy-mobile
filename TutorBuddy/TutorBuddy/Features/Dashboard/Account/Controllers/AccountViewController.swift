//
//  AccountViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import UIKit

class AccountViewController: BaseViewController<AccountView, IDashBoardViewModel> {
    
    fileprivate let diContainer = AppDelegate.dependencyContainer

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (parent as? TBDashBoardViewController)?.showNavBar()
        (parent as? TBDashBoardViewController)?.configureNavBar(title: "Profile")
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.signoutHandler = signOut
        }
    }
    
    fileprivate func signOut() {
        showConfirmationDialogViewController(confirmationText: .LOGOUT_CONFIRMATION_MESSAGE, yesHandler: { [weak self] in
            guard let self = self else { return }
            self.preference.user = nil
            self.preference.accessToken = ""
            self.preference.userID = ""
            self.preference.refreshToken = ""
            self.setViewControllers(using: self.diContainer.signInController)
        })
    }

}
