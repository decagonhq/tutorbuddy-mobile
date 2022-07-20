//
//  OnboardingViewController.swift
//  TutorBuddy
//

import UIKit

class OnboardingViewController: BaseViewController<OnboardingView, IOnboardingViewModel> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        configureNavBar(centerImage: R.image.launch_screen_logo())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        setBackButtonText()
    }
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
//            $0.skipButtonTapHandler = getStarted
            $0.getStartedButtonTapHandler = getStarted
        }
    }
    
    fileprivate func getStarted() {
        preference.hasOnboarded = true
        setViewControllers(using: AppDelegate.dependencyContainer.selectOptionsController)
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .dashboard {
                self?.setViewControllers(using: ViewController())
            } else {
                self?.getStarted()
            }
        }.disposed(by: disposeBag)
    }

}
