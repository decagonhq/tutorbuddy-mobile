//
//  WelcomeView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 20/07/2022.
//

import UIKit

class WelcomeView: BaseScrollView {
    
    var letsGoHandler: NoParamHandler?
    
    fileprivate let welcomeImageView = UIImageView(image: R.image.welcome_banner(), height: 160)
    fileprivate let welcomeLabel = UILabel(text: .WELCOME_TO, font: .interRegular(size: 16), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let tutorBuddyLabel = UILabel(text: .TUTOR_BUDDY, font: .interExtraBold(size: 35), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let subtitleLabel = UILabel(text: .WE_CREATED_A_PERSONAL_ACCOUNT_FOR_YOU, font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, tutorBuddyLabel, subtitleLabel], spacing: 15)
    
    fileprivate lazy var letsGoButton = TBButton(title: .LETS_GO, height: 50, tapAction: handleLetsGoButtonTapped)
    
    override func setup() {
        super.setup()
        
        welcomeImageView.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 120))
            $0.centerXInSuperview()
        }
        
        labelsStackView.do {
            _addSubview($0)
            $0.anchor(top: welcomeImageView.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 50, left: 50, right: 50))
        }

        letsGoButton.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 40, left: 20, right: 20))
        }
    }
    
    fileprivate func handleLetsGoButtonTapped() {
        letsGoHandler?()
    }
}
