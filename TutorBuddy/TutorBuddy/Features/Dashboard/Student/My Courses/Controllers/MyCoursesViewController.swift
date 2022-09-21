//
//  NotificationViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import UIKit

class MyCoursesViewController: BaseViewController<MyCoursesView, IDashBoardViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (parent as? TBDashBoardViewController)?.showNavBar()
        (parent as? TBDashBoardViewController)?.configureNavBar(title: "My Courses")
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.viewModel = viewModel
            $0.setupBindings()
        }
        viewModel.getMyCourses(params: [:])
    }

}
