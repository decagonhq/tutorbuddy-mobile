//
//  ResetPasswordView.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit
import AttributedStringBuilder
import SVPinView

class ResetPasswordView: BaseScrollView {
    
    var resetPasswordHandler: TripleStringParamHandler?
    var backButtonTapHandler: NoParamHandler?
    var resendOTPTapHandler: NoParamHandler?
    fileprivate var countdownTimer: Timer?
    fileprivate var releaseDate: Date!
    
    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black,tapAction: handleBackButtonTapped)
    fileprivate let welcomeLabel = UILabel(text: .CREATE_NEW_PASSWORD, font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let hintLabel = UILabel(text: .AN_OTP_HAS_BEEN_SENT, font: .interRegular(size: 16), color: .primaryTextColor, alignment: .left)
    fileprivate let codeExpiryHintLabel = UILabel(text: .THIS_CODE_WILL_EXPIRE, font: .interRegular(size: 16), color: .primaryTextColor, alignment: .left)
    fileprivate let timerLabel = UILabel(text: "00:00", font: .interRegular(size: 16), color: .primaryColor, alignment: .left)
    
    fileprivate lazy var expiryStackView: HorizontalStackView = {
        HorizontalStackView(arrangedSubviews: [codeExpiryHintLabel, timerLabel], spacing: 0)
    }()
    
    fileprivate lazy var resendOTPButton: TBButton = {
        let attrTitle = AttributedStringBuilder()
            .text(.DIDNT_RECEIVE, attributes: [.font(.interRegular(size: 15)), .textColor(.primaryTextColor)])
            .text(.CLICK_HERE, attributes: [.font(.interRegular(size: 15)), .textColor(.primaryColor)])
            .attributedString
        return TBButton(attributedTitle: attrTitle, backgroundColor: .clear, tapAction: handleResendOTPButtonTapped)
    }()
    
    fileprivate lazy var otpView: SVPinView = {
        SVPinView().apply {
            $0.pinLength = 4
            $0.secureCharacter = "\u{25CF}"
            $0.interSpace = 15
            $0.textColor = .primaryTextColor
            $0.shouldSecureText = true
            $0.style = .box
            $0.fieldCornerRadius = 5
            $0.activeFieldCornerRadius = 5
            
            $0.borderLineColor = .primaryTextColor.withAlphaComponent(0.7)
            $0.activeBorderLineColor = .primaryTextColor.withAlphaComponent(0.7)
            $0.borderLineThickness = 1
            $0.activeBorderLineThickness = 1

            $0.font = .interExtraBold(size: 20)
            $0.keyboardType = .phonePad
            $0.keyboardAppearance = .default
            $0.pinInputAccessoryView = UIView()
            $0.placeholder = "\u{25CF}\u{25CF}\u{25CF}\u{25CF}"
            $0.becomeFirstResponderAtIndex = 0
            $0.isContentTypeOneTimeCode = true
            
//            $0.didFinishCallback = { [weak self] pin in
//                self?.verifyTapHandler?(pin)
//            }
        }
    }()
    
    fileprivate let errorLabel = UILabel(text: .OTP_IS_REQUIRED, font: .interRegular(size: 14), color: .systemRed)
    
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [hintLabel, expiryStackView], spacing: 0)
    fileprivate let passwordTextfield = TBTextField(title: .NEW_PASSWORD, placeholder: .NEW_PASSWORD,  isPassword: true, validationType: .password)
    fileprivate let confirmPasswordTextfield = TBTextField(title: .CONFIRM_PASSWORD, placeholder: .CONFIRM_PASSWORD,  isPassword: true, validationType: .confirmPassword)
    
    fileprivate lazy var resetPasswordButton = TBButton(title: .RESET_PASSWORD, height: 50, tapAction: handleResetPasswordButtonTapped)
    
    override func setup() {
        super.setup()
        
        backButton.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, padding: ._init(top: 30, left: 20))
        }
        
        welcomeLabel.do {
            _addSubview($0)
            $0.anchor(top:backButton.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
        }
    
        labelsStackView.do {
            _addSubview($0)
            $0.anchor(top:welcomeLabel.bottomAnchor, leading: welcomeLabel.leadingAnchor, trailing: welcomeLabel.trailingAnchor, padding: ._init(top: 10/*, left: 20, right: 20*/))
        }
        
        otpView.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, padding: ._init(top: 40))
            $0.centerXInSuperview()
        }
        
        errorLabel.do {
            _addSubview($0)
            $0.anchor(top: otpView.bottomAnchor, leading: welcomeLabel.leadingAnchor, trailing: welcomeLabel.trailingAnchor, padding: ._init(top: 8))
            $0.showView(false)
        }
        
        resendOTPButton.do {
            _addSubview($0)
            $0.anchor(top: errorLabel.bottomAnchor, padding: ._init(top: 10))
            $0.centerXInSuperview()
        }
        
        passwordTextfield.do {
            _addSubview($0)
            $0.anchor(top: resendOTPButton.bottomAnchor, leading: welcomeLabel.leadingAnchor, trailing: welcomeLabel.trailingAnchor, padding: ._init(top: 20))
        }
        
        confirmPasswordTextfield.do {
            _addSubview($0)
            $0.anchor(top: passwordTextfield.bottomAnchor, leading: welcomeLabel.leadingAnchor, trailing: welcomeLabel.trailingAnchor, padding: ._init(top: 20))
        }

        resetPasswordButton.do {
            _addSubview($0)
            $0.anchor(top: confirmPasswordTextfield.bottomAnchor, leading: welcomeLabel.leadingAnchor, trailing: welcomeLabel.trailingAnchor, padding: ._init(top: 40))
        }
    }
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
    
    fileprivate func handleResetPasswordButtonTapped() {
        if otpView.getPin().countEquals(4) && passwordTextfield.isValid && confirmPasswordTextfield.isValidPasswordConfirmation(password: passwordTextfield.text) {
            resetPasswordHandler?(otpView.getPin(), passwordTextfield.text, confirmPasswordTextfield.text)
        }
    }
    
    fileprivate func handleResendOTPButtonTapped() {
        resendOTPTapHandler?()
    }
    
    func startTimer() {
        releaseDate = Date().plus(4, component: .minute).usingFormat()
        resendOTPButton.enable(false)
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        countdownTimer?.invalidate()
        timerLabel.text = "00:00"
        resendOTPButton.enable()
    }
    
    @objc fileprivate func updateTime() {
        let comps = Calendar.current.dateComponents([.minute, .second], from: Date(), to: releaseDate)
        timerLabel.text = "\(comps.minute ?? 0):\(comps.second ?? 0)"
        if releaseDate <= Date() {
            stopTimer()
        }
    }
}

