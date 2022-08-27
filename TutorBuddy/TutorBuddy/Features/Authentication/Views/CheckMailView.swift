//
//  CheckMailView.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 21/07/2022.
//

import UIKit

class CheckMailView: BaseScrollView {
    
    var checkMailHandler: NoParamHandler?
    
    fileprivate let checkMailImageView = UIImageView(image: R.image.check_mail(), height: 160)
    fileprivate let welcomeLabel = UILabel(text: .CHECK_YOUR_MAIL, font: .interExtraBold(size: 25), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let subtitleLabel = UILabel(text: .WE_HAVE_SENT_PASSWORD_RECOVERY_INSTRUCTIONS, font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, subtitleLabel], spacing: 15)
    
    fileprivate lazy var letsGoButton = TBButton(title: .OPEN_EMAIL_APP, height: 50, tapAction: handleLeOPenMailButtonTapped)
    
    override func setup() {
        super.setup()
        
        checkMailImageView.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 40))
            $0.centerXInSuperview()
        }
        
        labelsStackView.do {
            _addSubview($0)
            $0.anchor(top: checkMailImageView.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 50, left: 50, right: 50))
        }

        letsGoButton.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 40, left: 20, right: 20))
        }
    }
    
    fileprivate func handleLeOPenMailButtonTapped() {
        checkMailHandler?()
    }
}
