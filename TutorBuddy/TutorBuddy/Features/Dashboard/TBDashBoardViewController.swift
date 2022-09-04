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
    fileprivate lazy var studentDashboardHomeViewController = diContainer.studentDashboardHomeController
    fileprivate lazy var allCoursesViewController = diContainer.allCoursesController
    fileprivate lazy var myCoursesViewController = diContainer.myCoursesController
    fileprivate lazy var studentAccountViewController = diContainer.studentAccountController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .primaryColor
        viewControllers = [createHomeVC(), createCategoryVC(), createMyCoursesVC(), createAccountVC()]
    }
    
    private func createHomeVC() -> UIViewController {
        studentDashboardHomeViewController.tabBarItem.title = "Home"
        studentDashboardHomeViewController.tabBarItem.image = R.image.home_icon()
        return studentDashboardHomeViewController
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
        studentAccountViewController.tabBarItem.title = "Account"
        studentAccountViewController.tabBarItem.image = R.image.account_icon()
        return studentAccountViewController
    }
    
}
