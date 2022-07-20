//
//  ACPhoneNumberTextField.swift
//  TutorBuddy
//

import UIKit
import DropDown

public class TBPhoneNumberTextField: BaseView {
    
//    fileprivate lazy var floatingLabel: UILabel = {
//        UILabel().apply {
//            $0.text = .PHONE_NUMBER
//            $0.font = .avenirRegular(size: 14)
//            $0.textAlignment = .left
//            $0.textColor = .primaryTextColor
//        }
//    }()
//
//    fileprivate lazy var textfield: UITextField = {
//        UITextField().apply {
//            $0.font = .avenirBold(size: 13)
//            $0.placeholder = "e.g 814 521 3883"
//            $0.textColor = .aLabel
//            $0.keyboardType = .phonePad
//            $0.delegate = self
//            $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//        }
//    }()
//
//    lazy var flagImageView: UIImageView = {
//        UIImageView(image: preference.country?.flag ?? R.image.nig_flag_icon()).apply {
//            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//            $0.constraintSize(constant: 22)
//        }
//    }()
//
//    fileprivate lazy var codeLabel: UILabel = {
//        UILabel(text: preference.country?.phoneCode ?? "+234", font: .avenirBold(size: 12)).apply {
//            $0.textAlignment = .center
//            $0.textColor = .aLabel
//            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        }
//    }()
//
//    lazy var codeDropdownIcon: UIImageView = {
//        UIImageView(image: R.image.arrow_down_icon()).apply {
//            $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        }
//    }()
//
//    lazy var codeStackView: HorizontalStackView = {
//        HorizontalStackView(arrangedSubviews: [flagImageView, codeLabel, codeDropdownIcon], spacing: 10).apply {
//            $0.animateViewOnTapGesture(completion: handleCodeStackViewTapped)
//        }
//    }()
//
//    fileprivate lazy var contentStackView: HorizontalStackView = {
//        HorizontalStackView(arrangedSubviews: [codeStackView, textfield], spacing: 15)
//    }()
//
//    fileprivate lazy var contentView: UIView = {
//        UIView().apply {
//            $0.borderColor = .primaryTextColor.withAlphaComponent(0.7)
//            $0.viewBorderWidth = 1
//            $0.viewCornerRadius = 6
//            $0.constraintHeight(constant: 50)
//            $0.addSubview(contentStackView)
//            contentStackView.anchor(leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))
//            contentStackView.centerYInSuperview()
//        }
//    }()
//
//    fileprivate lazy var containerStackView: VerticalStackView = {
//        VerticalStackView(arrangedSubviews: [floatingLabel, contentView], spacing: 5)
//    }()
//
//    fileprivate lazy var dropdownView: DropDown = {
//        DropDown().apply {
//            $0.dataSource = Constants.PHONE_CODES
//            $0.selectionAction = { [weak self] _, item in
//                self?.code = item
//            }
//        }
//    }()
//
//    public var code: String {
//        get { codeLabel.text.orEmpty }
//        set {
//            codeLabel.text = newValue
//            flagImageView.image = Constants.COUNTRY_FLAG(code: newValue)
//            number = String(number.prefix(maxLength))
//        }
//    }
//
//    public var number: String {
//        get { textfield.text.orEmpty }
//        set { textfield.text = newValue }
//    }
//
//    public var fullNumber: String { "\(code)\(number)" }
//
//    public override func setup() {
//        super.setup()
//        addSubview(containerStackView)
//        containerStackView.fillSuperview()
//    }
//
//    public convenience init(code: String) {
//        self.init(frame: .zero)
//        setup()
//        self.code = code
//    }
//
//    fileprivate func handleCodeStackViewTapped() {
//        dropdownView.apply {
//            $0.anchorView = codeStackView
//            $0.width = codeStackView.width
//            $0.show()
//        }
//    }
//
//    public var isValidNumber: Bool {
//        let valid = number.count == maxLength
//        if !valid {
//            shake()
//            textfield.becomeFirstResponder()
//        }
//        return valid
//    }
//
//    fileprivate var maxLength: Int { preference.country?.phoneMaxLength ?? 10 }
//
//    @objc fileprivate func textFieldDidChange(_ textField: UITextField) {
//        number = number.dropFirstIfZero
//    }
    
}

extension TBPhoneNumberTextField: UITextFieldDelegate {
    
//    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField.restrictToDigitsWithMaximumLength(range: range, string: string, maxLength: maxLength)
//    }
    
}
