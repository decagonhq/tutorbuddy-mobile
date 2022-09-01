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
        
        container.register(TBTutorDashboardViewController.self) { resolver in
            TBTutorDashboardViewController().apply { $0.viewModel = resolver.resolve(IDashBoardViewModel.self)! }
        }

        container.register(StudentHomeViewController.self) { StudentHomeViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(AllCoursesViewController.self) { AllCoursesViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(MyCoursesViewController.self) { MyCoursesViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(StudentAccountViewController.self) { StudentAccountViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
        container.register(CourseDetailsViewController.self) { CourseDetailsViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
//        container.register(TutorHomeViewController.self) { TutorHomeViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
//        
//        container.register(NotificationsViewController.self) { NotificationsViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
//        
//        container.register(TutorAccountViewController.self) { TutorAccountViewController(viewModel: $0.resolve(IDashBoardViewModel.self)!) }
        
    }
    
}
