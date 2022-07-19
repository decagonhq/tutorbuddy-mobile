//
//  SignUpView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 18/07/2022.
//

import UIKit

class StudentSignUpView: BaseScrollView {
    
    var backButtonTapHandler: NoParamHandler?

    fileprivate lazy var backButton = TBButton(backgroundColor: .appBackground, height: 28, width: 28, image: R.image.back_icon(), tintColor: .black, tapAction: handleBackButtonTapped)
    fileprivate let createAccountLabel = UILabel(text: "Create an account", font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let createAccountSubtitleLabel = UILabel(text: "Create your account, so that your learning and progress are never lost.", font: .interRegular(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [createAccountLabel, createAccountSubtitleLabel], spacing: 20)
    
    
    
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
    }
    
    
    
    
    fileprivate func handleBackButtonTapped() {
        backButtonTapHandler?()
    }
}
