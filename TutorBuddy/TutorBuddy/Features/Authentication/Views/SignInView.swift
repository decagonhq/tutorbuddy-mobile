//
//  SignInView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 31/12/2021.
//

import UIKit

class SignInView: BaseScrollView {
    
    var createAnAccountTapHandler: NoParamHandler?
    var forgotPasswordTapHandler: NoParamHandler?
    var signinTapHandler: DoubleStringParamHandler?

    fileprivate let loginLabel = UILabel(text: .LOGIN, font: .interExtraBold(size: 22), color: .primaryTextColor, alignment: .left)
    fileprivate let emailTextfield = TBTextField(title: .EMAIL, placeholder: .ENTER_EMAIL, validationType: .emailOrPhone)
    fileprivate let passwordTextField = TBTextField(title: .PASSWORD, placeholder: .ENTER_PASSWORD, isPassword: true, validationType: .password)
    fileprivate lazy var signInButton = TBButton(title: .LOGIN, height: 50, tapAction: handleSignInButtonTapped)
    fileprivate lazy var inputStackView = VerticalStackView(arrangedSubviews: [emailTextfield, passwordTextField, signInButton], spacing: 30)
    
    fileprivate lazy var forgotPasswordButton = TBButton(title: .FORGOT_PASSWORD+"?", font: .interRegular(size: 15), backgroundColor: .clear, textColor: .link, tapAction: handleForgotPasswordButtonTapped)
    fileprivate let dontHaveAnAccountLabel = UILabel(text: "Don't have an account?", font: .interRegular(size: 14), color: .primaryTextColor)
    fileprivate lazy var createAnAccountButton = TBButton(title: "Sign Up", font: .interExtraBold(size: 14), backgroundColor: .appBackground, textColor: .primaryColor, tapAction: handleCreateAnAccountTapped)
    fileprivate lazy var accoutActionsStackView = HorizontalStackView(arrangedSubviews: [dontHaveAnAccountLabel, createAnAccountButton]).withWidth(220)
    
    fileprivate lazy var signinWithAppleButton = TBButton(backgroundColor: .black.withAlphaComponent(0.03), cornerRadius: 25, height: 50, width: 50, image: R.image.apple_icon(), tapAction: signinWithAppleTapped)
    fileprivate lazy var signinWithGoogleButton = TBButton(backgroundColor: .black.withAlphaComponent(0.03), cornerRadius: 25, height: 50, width: 50, image: R.image.google_icon(), tapAction: signinWithGoogleTapped)
    fileprivate lazy var socialAccountsStackView = HorizontalStackView(arrangedSubviews: [signinWithAppleButton, signinWithGoogleButton], spacing: 50).withWidth(150)
    
    override func addConstraints() {
        loginLabel.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 80, left: 20, right: 20))
        }
        
        inputStackView.do {
            _addSubview($0)
            $0.anchor(top: loginLabel.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
        }
        
        forgotPasswordButton.do {
            _addSubview($0)
            $0.anchor(top: signInButton.bottomAnchor, leading: inputStackView.leadingAnchor, trailing: inputStackView.trailingAnchor, padding: ._init(top: 40, left: 0, bottom: 0, right: 0))
        }
        
        accoutActionsStackView.do {
            _addSubview($0)
            $0.anchor(top: forgotPasswordButton.bottomAnchor, padding: ._init(top: 30))
            $0.centerXInSuperview()
        }
        
        socialAccountsStackView.do {
            _addSubview($0)
            $0.anchor(top: accoutActionsStackView.bottomAnchor, padding: ._init(top: 30))
            $0.centerXInSuperview()
        }
    }
    
    fileprivate func handleForgotPasswordButtonTapped() {
        forgotPasswordTapHandler?()
    }
    
    fileprivate func handleSignInButtonTapped() {
        if [emailTextfield, passwordTextField].areValid {
            signinTapHandler?(emailTextfield.text, passwordTextField.text)
        }
    }
    
    fileprivate func handleCreateAnAccountTapped() {
        createAnAccountTapHandler?()
    }
    
    fileprivate func signinWithAppleTapped() {
    }
    
    fileprivate func signinWithGoogleTapped() {
    }
}
