//
//  TutorHomeViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class TutorHomeViewController: BaseViewController<TutorHomeView, IDashBoardViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getUserDetails()
        (parent as? TBTutorDashboardViewController)?.showNavBar(false)
    }
    
    override func configureViews() {
        super.configureViews()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        viewModel.userName.bind(to: kview.userNameLabel.rx.text).disposed(by: disposeBag)
    }
}
