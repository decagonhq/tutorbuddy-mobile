//
//  ViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 16/07/2022.
//

import UIKit


final class TBTutorDashboardViewController: UITabBarController {
    
    var viewModel: IDashBoardViewModel?
    
    fileprivate let diContainer = AppDelegate.dependencyContainer
    fileprivate weak var currentlyVisibleViewController: UIViewController?
    fileprivate lazy var tutorDashboardHomeViewController = diContainer.tutorDashboardHomeController
    fileprivate lazy var notificationsViewController = NotificationsViewController()
    fileprivate lazy var tutorAccountViewController = TutorAccountViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .primaryColor
        viewControllers = [createHomeVC(), createNotificationsVC(), createAccountVC()]
    }
    
    private func createHomeVC() -> UIViewController {
        tutorDashboardHomeViewController.tabBarItem.title = "Home"
        tutorDashboardHomeViewController.tabBarItem.image = R.image.home_icon()
        return tutorDashboardHomeViewController
    }
    
    private func createNotificationsVC() -> UIViewController {
        notificationsViewController.tabBarItem.title = "Notifications"
        notificationsViewController.tabBarItem.image = R.image.unread_notification_icon()
        return notificationsViewController
    }
    
    private func createAccountVC() -> UIViewController {
        tutorAccountViewController.tabBarItem.title = "Account"
        tutorAccountViewController.tabBarItem.image = R.image.account_icon()
        return tutorAccountViewController
    }
    
}
