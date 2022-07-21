//
//  ResetPasswordView.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit


class ResetPasswordView: BaseScrollView {
    
    var resetPasswordHandler: NoParamHandler?
    var backButtonTapHandler: NoParamHandler?
    
    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black,tapAction: handleBackButtonTapped)
    fileprivate let welcomeLabel = UILabel(text: "Create New Password", font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [welcomeLabel], spacing: 10)
    fileprivate let passwordTextfield = TBTextField(title: .NEW_PASSWORD, placeholder: "New Password",  isPassword: true, validationType: .password)
    fileprivate let confirmPasswordTextfield = TBTextField(title: .CONFIRM_PASSWORD, placeholder: "Confirm Password",  isPassword: true, validationType: .confirmPassword)
    
    fileprivate lazy var resetPasswordButton = TBButton(title: "Reset Password", height: 50, tapAction: handleResetPasswordButtonTapped)
    
    override func setup() {
        super.setup()
        
        backButton.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, padding: ._init(top: 30, left: 20))
        }
    
        labelsStackView.do {
            _addSubview($0)
            $0.anchor(top:backButton.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
        }
        
        passwordTextfield.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 20, left: 20, right: 20))
        }
        
        confirmPasswordTextfield.do {
            _addSubview($0)
            $0.anchor(top: passwordTextfield.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 20, left: 20, right: 20))
        }

        resetPasswordButton.do {
            _addSubview($0)
            $0.anchor(top: confirmPasswordTextfield.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 40, left: 20, right: 20))
        }
    }
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
    
    fileprivate func handleResetPasswordButtonTapped() {
        resetPasswordHandler?()
    }
}

