//
//  TBDashBoardViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import UIKit

class TBDashBoardViewController: UITabBarController {
  
  var viewModel: IDashBoardViewModel?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
      tabBar.tintColor  =  UIColor(red: 0.992, green: 0.161, blue: 0.349, alpha: 1)
    viewControllers = [createHomeNC(), createReminderNC(), createNotificationNC(), createAccountNC()]
  }
  
  private func createHomeNC() -> UINavigationController {
    let homeVC = HomeViewController()
    homeVC.tabBarItem.title = "Home"
    homeVC.tabBarItem.image = UIImage(named: "homeIcon")
                                   
    return UINavigationController(rootViewController: homeVC)
  }
  
  private func createReminderNC() -> UINavigationController {
    let reminderVC = ReminderViewController()
      reminderVC.tabBarItem.title = "reminder"
      reminderVC.tabBarItem.image = UIImage(named: "reminderIcon")
    return UINavigationController(rootViewController: reminderVC)
  }
  
  private func createNotificationNC() -> UINavigationController {
    let notificationNC = NotificationViewController()
      notificationNC.tabBarItem.title = "Notification"
      notificationNC.tabBarItem.image = UIImage(named: "notificationIcon")
    return UINavigationController(rootViewController: notificationNC)
  }
  
  private func createAccountNC() -> UINavigationController {
    let accountVC = AccountViewController()
      accountVC.tabBarItem.title = "Account"
      accountVC.tabBarItem.image = UIImage(named: "accountIcon")
    return UINavigationController(rootViewController: accountVC)
  }
 
}
