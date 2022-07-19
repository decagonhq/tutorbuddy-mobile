//
//  SelectOptionsView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 19/07/2022.
//

import UIKit

final class SelectOptionsView: BaseScrollView {
    
    var exploreButtonHandler: StringParamHandler?
    var role: String?
    
    fileprivate let howWouldYouUseThisAppLabel = UILabel(text: "How would you want to use this app?", font: .interExtraBold(size: 25), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let selectOptionLabel = UILabel(text: "Please select an option", font: .interRegular(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [howWouldYouUseThisAppLabel, selectOptionLabel], spacing: 16)
    
    fileprivate let studentLabel = UILabel(text: "Student", font: .interExtraBold(size: 17), numberOfLines: 1, color: .white, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let tutorLabel = UILabel(text: "Tutor", font: .interExtraBold(size: 17), numberOfLines: 1, color: .white, alignment: .center, adjustsFontSizeToFitWidth: false)
    lazy var studentOption = UIImageView(subviews: [studentLabel], image: R.image.student_banner(), contentMode: .scaleToFill, height: 170).apply { $0.viewBorderWidth = 2; $0.borderColor = .appBackground }
    lazy var tutorOption = UIImageView(subviews: [tutorLabel], image: R.image.tutor_banner(), contentMode: .scaleToFill, height: 170).apply { $0.viewBorderWidth = 2; $0.borderColor = .appBackground }
    fileprivate lazy var optionsStackView = VerticalStackView(arrangedSubviews: [studentOption, tutorOption], spacing: 30)
    
    fileprivate lazy var exploreButton = TBButton(title: "Explore", font: .interBold(size: 15), backgroundColor: .primaryColor, textColor: .white, cornerRadius: 5, height: 50, tapAction: exploreButtonTapped)
    
    override func setup() {
        super.setup()
        labelsStackView.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
        }
        
        optionsStackView.do {
            _addSubview($0)
            $0.anchor(top: labelsStackView.bottomAnchor, leading: labelsStackView.leadingAnchor, trailing: labelsStackView.trailingAnchor, padding: ._init(top: 30))
        }
        
        exploreButton.do {
            _addSubview($0)
            $0.anchor(top: optionsStackView.bottomAnchor, leading: labelsStackView.leadingAnchor, trailing: labelsStackView.trailingAnchor, padding: ._init(top: 60))
        }
        [studentLabel, tutorLabel].forEach { $0.centerInSuperview() }
    }
    
    fileprivate func exploreButtonTapped() {
        exploreButtonHandler?(role ?? "")
    }

}
