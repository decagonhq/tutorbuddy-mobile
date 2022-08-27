//
//  VerifyOTPView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 23/08/2022.
//

import UIKit
import AttributedStringBuilder
import SVPinView

class VerifyOTPView: BaseScrollView {

    var verifyTapHandler: StringParamHandler?
    var resendOTPTapHandler: NoParamHandler?
    var backButtonTapHandler: NoParamHandler?

    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black, tapAction: handleBackButtonTapped)
    fileprivate let enterOTPLabel = UILabel(text: .ENTER_OTP, font: .interExtraBold(size: 22), color: .primaryTextColor)
    fileprivate let hintLabel = UILabel(text: .AN_OTP_HAS_BEEN_SENT, font: .interRegular(size: 16), color: .primaryTextColor)
    fileprivate let codeExpiryHintLabel = UILabel(text: .THIS_CODE_WILL_EXPIRE, font: .interRegular(size: 16), color: .primaryTextColor)
    fileprivate let timerLabel = UILabel(text: "00:00", font: .interRegular(size: 16), color: .primaryColor)
    fileprivate lazy var verifyButton: TBButton = {
        TBButton(title: "Verify", height: 50, tapAction: handleVerifyButtonTapped)
    }()
    fileprivate lazy var expiryStackView: HorizontalStackView = {
        HorizontalStackView(arrangedSubviews: [codeExpiryHintLabel, timerLabel], spacing: 2)
    }()
    fileprivate lazy var hintStackView: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [hintLabel, expiryStackView], spacing: 4, alignment: .center)
    }()
    fileprivate lazy var labelStackView: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [enterOTPLabel, hintStackView], spacing: 10, alignment: .center)
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
            
            $0.didFinishCallback = { [weak self] pin in
                self?.verifyTapHandler?(pin)
            }
        }
    }()
    fileprivate let errorLabel = UILabel(text: .OTP_IS_REQUIRED, font: .interRegular(size: 14), color: .systemRed)
    
    fileprivate var countdownTimer: Timer?
    fileprivate var releaseDate: Date!
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
    }
    
    override func addConstraints() {
        _addSubviews(backButton, labelStackView, otpView, errorLabel, resendOTPButton, verifyButton)
        backButton.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, padding: ._init(top: 30, left: 20))
        }
        
        labelStackView.do {
            $0.anchor(top: backButton.bottomAnchor, padding: ._init(top: 30))
            $0.centerXInSuperview()
        }
        otpView.do {
            $0.anchor(top: labelStackView.bottomAnchor, padding: ._init(top: 40))
            $0.centerXInSuperview()
        }
        errorLabel.do {
            $0.anchor(top: otpView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 8))
            $0.showView(false)
        }
        resendOTPButton.do {
            $0.anchor(top: errorLabel.bottomAnchor, padding: ._init(top: 20))
            $0.centerXInSuperview()
        }
        verifyButton.anchor(top: resendOTPButton.bottomAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor, padding: ._init(top: 60, left: 20, bottom: 40, right: 20))
    }
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
    
    fileprivate func handleVerifyButtonTapped() {
        if otpView.getPin().countEquals(4) {
            errorLabel.showView(false)
            verifyTapHandler?(otpView.getPin())
        } else {
            errorLabel.showView()
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
