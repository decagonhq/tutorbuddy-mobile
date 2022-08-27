//
//  OnboardingViewController.swift
//  TutorBuddy
//

import UIKit

class OnboardingViewController: BaseViewController<OnboardingView, IOnboardingViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.onboardingBackgroundOne)
    }
    
    override func configureViews() {
        super.configureViews()
        kview.do {
            $0.skipButtonTapHandler = getStarted
            $0.getStartedButtonTapHandler = getStarted
            $0.nextButtonTapHandler = { [weak self] currentPage in
                switch currentPage {
                case 0:
                    self?.setBackgroundColor(.onboardingBackgroundOne)
                case 1:
                    self?.setBackgroundColor(.onboardingBackgroundTwo)
                case 2:
                    self?.setBackgroundColor(.onboardingBackgroundThree)
                default:
                    self?.setBackgroundColor(.onboardingBackgroundOne)
                }
            }
        }
    }
    
    fileprivate func getStarted() {
        preference.hasOnboarded = true
        setViewControllers(using: AppDelegate.dependencyContainer.signInController)
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .dashboard {
                self?.setViewControllers(using: TBDashBoardViewController())
            } else {
                self?.getStarted()
            }
        }.disposed(by: disposeBag)
    }

}
