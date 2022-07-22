//
//  ForgotPasswordView.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit


class ForgotPasswordView: BaseScrollView {
    
    var resetPasswordHandler: NoParamHandler?
    var backButtonTapHandler: NoParamHandler?
    
    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black,tapAction: handleBackButtonTapped)
    fileprivate let welcomeLabel = UILabel(text: "Reset Password", font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let subtitleLabel = UILabel(text: "Enter the email associated with your account and  we’ll send an email with instruction to reset your password", font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, subtitleLabel], spacing: 15)
    fileprivate let emailTextfield = TBTextField(title: .EMAIL, placeholder: "enter your decagon email", validationType: .email)
    
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
        
        emailTextfield.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 20, left: 20, right: 20))
        }

        resetPasswordButton.do {
            _addSubview($0)
            $0.anchor(top: emailTextfield.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 40, left: 20, right: 20))
        }
    }
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
    
    fileprivate func handleResetPasswordButtonTapped() {
        resetPasswordHandler?()
    }
}
