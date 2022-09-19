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
        navigationItem.backButtonTitle = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (parent as? TBDashBoardViewController)?.showNavBar(false)
        (parent as? TBDashBoardViewController)?.configureNavBar(title: "")
        if preference.newFeatureTutorAddedOrRemoved {
            preference.newFeatureTutorAddedOrRemoved = false
            viewModel.getDashboardData()
        }
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.viewModel = viewModel
            $0.setupBindings()
            $0.notificationButton.animateViewOnTapGesture {
                self._pushViewController(AppDelegate.dependencyContainer.notificationsController)
            }
            
            $0.seeAllButtonTapHandler = { [weak self] in
                self?.tabBarController?.selectedIndex = 1
            }
            
            $0.courseSelectedHandler = { [weak self] course, index in
                self?.viewModel.selectedRecommendedCourse = course
                self?.viewModel.getRecommendedCourseDetails()
            }
            
            $0.tutorSelectedHandler = { [weak self] tutor, index in
                self?.viewModel.selectedFeatureTutor = tutor
                self?.viewModel.getFeaturedTutorDetails()
            }
        }
        viewModel.getDashboardData()
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        viewModel.userName.bind(to: kview.userNameLabel.rx.text).disposed(by: disposeBag)
        observeRecommendedSubjectDetailsData()
        observeFeaturedTutorDetailsData()
    }
    
    fileprivate func observeRecommendedSubjectDetailsData() {
        viewModel.recommendedSubjectDetailsData.bind { [weak self] data in
            guard let self = self else { return }
            with(AppDelegate.dependencyContainer.courseDetailsController.apply { $0.recommendedSubjectDetailsData = data; $0.ratings = data.tutorComments }) {
                $0.modalPresentationStyle = .overFullScreen
                $0.setBackgroundColor()
                self.present($0, animated: true)
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeFeaturedTutorDetailsData() {
        viewModel.featuredTutorDetailsData.bind { [weak self] data in
            guard let self = self else { return }
            with(TutorDetailsViewController().apply { $0.tutor = data }) {
                self.present($0, animated: true)
            }
        }.disposed(by: disposeBag)
    }
    
}
