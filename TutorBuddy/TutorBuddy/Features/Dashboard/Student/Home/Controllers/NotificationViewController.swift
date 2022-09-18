//
//  NotificationsViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 18/09/2022.
//

import UIKit

final class NotificationViewController: BaseViewController<NotificationView, IDashBoardViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar()
        configureNavBar(title: "Notifications")
        (parent as? TBTutorDashboardViewController)?.showNavBar()
        (parent as? TBTutorDashboardViewController)?.configureNavBar(title: "Notifications")
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
}

