//
//  TutorAccountViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

class TutorAccountViewController: BaseViewController<AccountView, IDashBoardViewModel> {

    fileprivate let diContainer = AppDelegate.dependencyContainer

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
        viewModel.getUserDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (parent as? TBDashBoardViewController)?.showNavBar()
        (parent as? TBTutorDashboardViewController)?.showNavBar()
        (parent as? TBDashBoardViewController)?.configureNavBar(title: "Profile")
        (parent as? TBTutorDashboardViewController)?.configureNavBar(title: "Profile")
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.signoutHandler = signOut
            $0.editProfileHandler = { [weak self] in
                self?._pushViewController(AppDelegate.dependencyContainer.editProfileController.apply { $0.delegate = self; $0.username = self?.kview.userFullName.text; $0.email = self?.preference.user?.email })
            }
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
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        viewModel.userName.bind(to: kview.userFullName.rx.text).disposed(by: disposeBag)
    }
}

extension TutorAccountViewController: AccountUpdatable {
    
    func update(with newName: String) {
        kview.userFullName.text = newName
    }
}
