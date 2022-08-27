//
//  SuccessfulTutorRequestViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 10/08/2022.
//

import UIKit
import AttributedStringBuilder

class SuccessfulTutorRequestViewController: UIViewController {
    
    var dismissHandler: NoParamHandler?
    
    fileprivate let requestSentIconText = IconTextView(text: "Request Sent", font: .interExtraBold(size: 25), placeholderIcon: R.image.success_icon(), iconTextAlignment: .iconTop, iconSize: 70, textColor: .primaryTextColor, textAlignment: .center, contentStackDistribution: .equalSpacing, contentStackAlignment: .center, contentSpacing: 20)
    fileprivate let _label = UILabel(text: "", numberOfLines: 0)
    fileprivate lazy var doneButton = TBButton(title: "Done", height: 50, tapAction: doneButtonTapped)
    fileprivate lazy var contentStackView = VerticalStackView(arrangedSubviews: [_label, doneButton], spacing: 30)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
        requestSentIconText.do {
            addSubview($0)
            $0.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(topBottom: 150,leftRight: 20))
        }
        contentStackView.do {
            addSubview($0)
            $0.anchor(top: requestSentIconText.bottomAnchor, leading: requestSentIconText.leadingAnchor, trailing: requestSentIconText.trailingAnchor, padding: ._init(topBottom: 30))
        }
        _label.attributedText = AttributedStringBuilder()
            .text("You've successfully requested the service of ", attributes: [.textColor(.primaryTextColor), .alignment(.center), .font(.interRegular(size: 16))])
            .text("Chuwkwudi Kamdibe. ", attributes: [.textColor(.primaryTextColor), .alignment(.center), .font(.interBold(size: 16))])
            .text("You will receive notification when the tutor accepts your request.", attributes: [.textColor(.primaryTextColor), .alignment(.center), .font(.interRegular(size: 16))])
            .attributedString
    }
    
    fileprivate func doneButtonTapped() {
        dismissViewController(animated: true) { [weak self] in
            self?.dismissHandler?()
        }
    }
    
}
