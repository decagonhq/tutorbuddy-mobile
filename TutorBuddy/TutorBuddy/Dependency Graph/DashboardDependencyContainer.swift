//
//  DashboardDependencyContainer.swift
//  TutorBuddy
//

import Foundation
import Swinject

struct DashboardDependencyContainer {
    
    static func configure(using container: Container) {
        container.register(IDashBoardViewModel.self) { DashBoardViewModelImpl(preference: $0.resolve(IPreference.self)!) }
        
        container.register(TBDashBoardViewController.self) { resolver in
            TBDashBoardViewController().apply { $0.viewModel = resolver.resolve(IDashBoardViewModel.self)! }
        }
        
        container.register(HomeViewController.self) { HomeViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(AllCoursesViewController.self) { AllCoursesViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(MyCoursesViewController.self) { MyCoursesViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(AccountViewController.self) { AccountViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(CourseDetailsViewController.self) { CourseDetailsViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
    }
    
}
