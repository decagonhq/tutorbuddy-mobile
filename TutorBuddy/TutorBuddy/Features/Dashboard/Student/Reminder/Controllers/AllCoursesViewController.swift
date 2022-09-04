//
//  ReminderViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import UIKit

class AllCoursesViewController: BaseViewController<UIView, IDashBoardViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (parent as? TBDashBoardViewController)?.showNavBar()
        (parent as? TBDashBoardViewController)?.configureNavBar(title: "All Courses")
    }
}
