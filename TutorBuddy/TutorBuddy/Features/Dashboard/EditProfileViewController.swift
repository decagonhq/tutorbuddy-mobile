//
//  EditProfileViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 05/09/2022.
//

import UIKit

class EditProfileViewController: BaseViewController<EditProfileView, IDashBoardViewModel> {
    
    var delegate: AccountUpdatable?
    var username: String!
    var email: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.userFullName.text = username
            $0.nameTextfield.text = username
            $0.emailTextfield.text = email
            $0.saveButtonTapHandler = { [weak self] fullName, email in
                self?.viewModel.updateUser(with: fullName, and: email)
                self?.delegate?.update(with: fullName)
            }
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeUserUpdated()
    }
    
    fileprivate func observeUserUpdated() {
        viewModel.userUpdated.bind { userUpdated in
            if userUpdated {
                runAfter(1.5) {
                    self._popViewController()
                }
            }
        }.disposed(by: disposeBag)
    }
}
