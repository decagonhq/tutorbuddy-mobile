//
//  HomeViewController.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import UIKit

class StudentHomeViewController: BaseViewController<StudentHomeView, IDashBoardViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (parent as? TBDashBoardViewController)?.showNavBar(false)
        if preference.newFeatureTutorAddedOrRemoved {
            preference.newFeatureTutorAddedOrRemoved = false
            viewModel.getUserDetails()
            viewModel.getFeaturedTutors(params: [:])
            viewModel.getAllRecommendedSubjects(params: [:])
        }
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.viewModel = viewModel
            $0.setupBindings()
            $0.seeAllButtonTapHandler = { [weak self] in
                self?.tabBarController?.selectedIndex = 1
            }
            
            $0.showtutorDetailsHandler = { [weak self] tutor, index in
                self?.present(TutorDetailsViewController().apply { $0.tutor = tutor }, animated: true)
            }
            
            $0.showCourseDetailsHandler = { [weak self] course, index in
                with(AppDelegate.dependencyContainer.courseDetailsController.apply { $0.course = course }) {
                    $0.modalPresentationStyle = .overFullScreen
                    $0.setBackgroundColor()
                    self?.present($0, animated: true)
                }
            }
        }
        viewModel.getUserDetails()
        viewModel.getFeaturedTutors(params: [:])
        viewModel.getAllRecommendedSubjects(params: [:])
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        viewModel.userName.bind(to: kview.userNameLabel.rx.text).disposed(by: disposeBag)
    }
    
}