//
//  TBDashBoardViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import UIKit

final class TBDashBoardViewController: UITabBarController {
    
    var viewModel: IDashBoardViewModel?
    
    fileprivate let diContainer = AppDelegate.dependencyContainer
    fileprivate weak var currentlyVisibleViewController: UIViewController?
    fileprivate lazy var dashboardHomeViewController = diContainer.dashboardHomeController
    fileprivate lazy var allCoursesViewController = diContainer.allCoursesController
    fileprivate lazy var myCoursesViewController = diContainer.myCoursesController
    fileprivate lazy var accountViewController = diContainer.accountController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .primaryColor
        viewControllers = [createHomeVC(), createCategoryVC(), createMyCoursesVC(), createAccountVC()]
    }
    
    private func createHomeVC() -> UIViewController {
        dashboardHomeViewController.tabBarItem.title = "Home"
        dashboardHomeViewController.tabBarItem.image = R.image.home_icon()
        return dashboardHomeViewController
    }
    
    private func createCategoryVC() -> UIViewController {
        allCoursesViewController.tabBarItem.title = "Category"
        allCoursesViewController.tabBarItem.image = R.image.category_icon()
        return allCoursesViewController
    }
    
    private func createMyCoursesVC() -> UIViewController {
        myCoursesViewController.tabBarItem.title = "My Courses"
        myCoursesViewController.tabBarItem.image = R.image.my_courses_icon()
        return myCoursesViewController
    }
    
    private func createAccountVC() -> UIViewController {
        accountViewController.tabBarItem.title = "Account"
        accountViewController.tabBarItem.image = R.image.account_icon()
        return accountViewController
    }
    
}
