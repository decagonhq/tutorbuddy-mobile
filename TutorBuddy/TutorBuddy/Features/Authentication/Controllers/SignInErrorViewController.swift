//
//  SignInErrorViewController.swift
//  TutorBuddy
//

import UIKit

final class SignInErrorViewController: UIViewController {
    
    var messageText: String = .AUTHENTICATION_ROLES_ERROR
    
    fileprivate lazy var titleTextLabel = UILabel(text: .AUTHENTICATION_ERROR, font: .interBold(size: 18), color: .primaryTextColor)
    fileprivate lazy var messageLabel = UILabel(text: messageText, font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor)
    fileprivate lazy var doneButton = TBButton(title: .DONE, height: 50) { [weak self] in
        self?.dismissViewController()
    }
    fileprivate lazy var contentStackView = VerticalStackView(arrangedSubviews: [titleTextLabel, messageLabel, doneButton], spacing: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        with(contentStackView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(topBottom: 30, leftRight: 20))
        }
    }

}
