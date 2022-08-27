//
//  ForgotPasswordView.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit


class ForgotPasswordView: BaseScrollView {
    
    var nextTapHandler: StringParamHandler?
    var backButtonTapHandler: NoParamHandler?
    
    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black,tapAction: handleBackButtonTapped)
    fileprivate let welcomeLabel = UILabel(text: .RESET_PASSWORD, font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let subtitleLabel = UILabel(text: .ENTER_THE_EMAIL_ASSOCIATED_WITH_YOUR_ACCOUNT, font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, subtitleLabel], spacing: 15)
    let emailTextfield = TBTextField(title: .EMAIL, placeholder: .ENTER_YOUR_EMAIL, validationType: .email)
    
    fileprivate lazy var nextButton = TBButton(title: .NEXT, height: 50, tapAction: handleResetPasswordButtonTapped)
    
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

        nextButton.do {
            _addSubview($0)
            $0.anchor(top: emailTextfield.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 40, left: 20, right: 20))
        }
    }
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
    
    fileprivate func handleResetPasswordButtonTapped() {
        if emailTextfield.isValid {
            nextTapHandler?(emailTextfield.text)
        }
    }
}
