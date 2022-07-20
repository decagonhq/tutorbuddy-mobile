//
//  TutorSignUpView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 19/07/2022.
//

import UIKit

class TutorSignUpView: BaseScrollView {

    var backButtonTapHandler: NoParamHandler?
    var signupTapHandler: TripleStringParamHandler?
    var loginTapHandler: NoParamHandler?

    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black, tapAction: handleBackButtonTapped)
    fileprivate let createAccountLabel = UILabel(text: "Create an account", font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let createAccountSubtitleLabel = UILabel(text: "Create your account to connect with students.", font: .interRegular(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [createAccountLabel, createAccountSubtitleLabel], spacing: 20)
    
    fileprivate let nameTextfield = TBTextField(title: .NAME, placeholder: "Your full name", validationType: .name)
    fileprivate let tellUsAboutYourselfTextfield = TBTextField(title: "Tell Us About Yourself", placeholder: "Short bio...", isBio: true, validationType: .name)
    fileprivate let uploadProfilePictureTextfield = TBTextField(title: "Upload Profile Picture", isUploadProfilePicture: true, validationType: .name)
    fileprivate let subjectsTextfield = TBTextField(title: "Subjects", placeholder: "Select", items: [], validationType: .name)
    fileprivate let availabilityTextfield = TBTextField(title: "Availability", placeholder: "Choose", items: [], validationType: .name)
    fileprivate let passwordTextField = TBTextField(title: .PASSWORD, placeholder: "Your password", isPassword: true, validationType: .password)
    fileprivate lazy var signUpButton = TBButton(title: "Sign Up", height: 50, tapAction: handleSignUpButtonTapped)
    fileprivate lazy var inputStackView = VerticalStackView(arrangedSubviews: [nameTextfield, tellUsAboutYourselfTextfield, uploadProfilePictureTextfield, subjectsTextfield, availabilityTextfield, passwordTextField, signUpButton], spacing: 15)
    
    fileprivate let alreadyHaveAnAccountLabel = UILabel(text: "Already have an account?", font: .interRegular(size: 14), color: .primaryTextColor)
    fileprivate lazy var logintButton = TBButton(title: .LOGIN, font: .interExtraBold(size: 14), backgroundColor: .appBackground, textColor: .primaryColor, tapAction: handleLoginTapped)
    fileprivate lazy var accoutActionsStackView = HorizontalStackView(arrangedSubviews: [alreadyHaveAnAccountLabel, logintButton], spacing: 5).withWidth(240)
    
    fileprivate lazy var signinWithAppleButton = TBButton(backgroundColor: .black.withAlphaComponent(0.03), cornerRadius: 25, height: 50, width: 50, image: R.image.apple_icon(), tapAction: signinWithAppleTapped)
    fileprivate lazy var signinWithGoogleButton = TBButton(backgroundColor: .black.withAlphaComponent(0.03), cornerRadius: 25, height: 50, width: 50, image: R.image.google_icon(), tapAction: signinWithGoogleTapped)
    fileprivate lazy var socialAccountsStackView = HorizontalStackView(arrangedSubviews: [signinWithAppleButton, signinWithGoogleButton], spacing: 50).withWidth(150)
    
    override func setup() {
        super.setup()
        
        backButton.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, padding: ._init(top: 30, left: 20))
        }
        
        labelsStackView.do {
            _addSubview($0)
            $0.anchor(top: backButton.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
        }
        
        inputStackView.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, leading: labelsStackView.leadingAnchor, trailing: labelsStackView.trailingAnchor, padding: ._init(top: 30))
        }
        
        accoutActionsStackView.do {
            _addSubview($0)
            $0.anchor(top: inputStackView.bottomAnchor, padding: ._init(top: 30))
            $0.centerXInSuperview()
        }
        
        socialAccountsStackView.do {
            _addSubview($0)
            $0.anchor(top: accoutActionsStackView.bottomAnchor, bottom: _bottomAnchor, padding: ._init(top: 30))
            $0.centerXInSuperview()
        }
    }
    
    
    
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
    
    fileprivate func handleSignUpButtonTapped() {
        if [nameTextfield, tellUsAboutYourselfTextfield, passwordTextField].areValid {
            signupTapHandler?(nameTextfield.text, tellUsAboutYourselfTextfield.text, passwordTextField.text)
        }
    }
    
    fileprivate func handleLoginTapped() {
        loginTapHandler?()
    }
    
    fileprivate func signinWithAppleTapped() {
    }
    
    fileprivate func signinWithGoogleTapped() {
    }
    
    private func addRightImageTo(field: TBTextField, image: UIImage?){
        let dropButton = UIButton(type: .system)
        dropButton.frame = CGRect(x: 0, y: 5, width: frame.height, height: frame.height)
        if let image = image {
            dropButton.setImage(image, for: .normal)
        }
        dropButton.tintColor = .primaryGrey
        dropButton.contentEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
        field.textField.rightView =  dropButton
        field.textField.rightViewMode = .always
    }
    
    private func addLeftImageTo(field: TBTextField, image: UIImage?){
        let dropButton = UIButton(type: .system)
        dropButton.frame = CGRect(x: 0, y: 5, width: frame.height, height: frame.height)
        if let image = image {
            dropButton.setImage(image, for: .normal)
        }
        dropButton.tintColor = .primaryGrey
        dropButton.contentEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
        field.textField.leftView =  dropButton
        field.textField.leftViewMode = .always
    }

}
