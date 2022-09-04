//
//  SignUpViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 18/07/2022.
//

import UIKit

class SignUpViewController: BaseViewController<SignUpView, IAuthViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getRegisterResource(showRegisterResources: true)
    }
    
    override func configureViews() {
        super.configureViews()
        
        kview.do {
            $0.backButtonTapHandler = { [weak self] in
                self?._popViewController()
            }
            
            $0.availabilityTextfield.animateViewOnTapGesture { [weak self] in
                self?.handleDropdownTapped(for: .availability)
            }
            
            $0.subjectsTextfield.animateViewOnTapGesture { [weak self] in
                self?.handleDropdownTapped(for: .subjects)
            }
            
            $0.loginTapHandler = { [weak self] in
                self?._popViewController()
            }
            
            $0.signupTapHandler = { [weak self] name, email, password, userType, bio in
                self?.viewModel.signup(name: name, email: email, password: password, userType: userType, bio: bio, selectedSubjects: self?.viewModel.selectedSubjects, selectedDays: self?.viewModel.selectedDays)
            }
            
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeAuthNavRoute()
        observeAuthErrorMessage()
    }
    
    fileprivate func observeAuthNavRoute() {
        viewModel.authNavRoute.bind { [weak self] route in
            if route == .verifyOTP {
                self?._pushViewController(AppDelegate.dependencyContainer.verifyOTPController.apply { $0.requestOTPEmailOrPhone = self?.kview.emailTextfield.text })
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func observeAuthErrorMessage() {
        viewModel.authErrorMessage.bind { message in
            self.showDialog(for: SignInErrorViewController().apply { $0.messageText = message })
        }.disposed(by: disposeBag)
    }
     
    fileprivate func handleDropdownTapped(for type: FormEntryType) {
        switch type {
        case .availability:
            present(ChooseAvailabilityViewController().apply {
                $0.days = viewModel.days
                $0.handleSelectedDaysSelected = { [weak self] days in
                    self?.kview.availabilityTextfield.valueText = days.map { $0.day ?? "" }.joined(separator: ", ")
                    self?.viewModel.selectedDays = days
                }
            }, animated: true)
        case .subjects:
            present(ChooseSubjectsViewController().apply {
                $0.subjects = viewModel.subjects
                $0.handleSelectedSubjectsSelected = { [weak self] subjects in
                    self?.kview.subjectsTextfield.valueText = subjects.map { $0.subject ?? "" }.joined(separator: ", ")
                    self?.viewModel.selectedSubjects = subjects
                }
            }, animated: true)
        default:
            break
        }
    }
    
    

}
