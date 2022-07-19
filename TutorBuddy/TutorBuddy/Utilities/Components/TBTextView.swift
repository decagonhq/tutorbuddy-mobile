//
//  ACTextView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 01/04/2022.
//

import UIKit

class TBTextView: BaseView {
    fileprivate let titleLabel = UILabel(text: "Title Label", font: .interRegular(size: 14), numberOfLines: 0, color: .primaryTextColor, alignment: .left)
    fileprivate let errorLabel = UILabel(text: "Error Label", font: .interRegular(size: 13), numberOfLines: 0, color: .systemRed, alignment: .left)
    let textView = UITextView()
    fileprivate var heightConstraint: NSLayoutConstraint?
    fileprivate var errorLabelHeightConstraint: NSLayoutConstraint?
    fileprivate var errorLabelVisible = false
    fileprivate var maxLength: Int? = nil
    
    var text: String {
        get { textView.text.orEmpty }
        set { textView.text = newValue }
    }
    
    convenience init(title: String, placeholder: String = "", height: CGFloat? = 180, maxLength: Int? = nil) {
        self.init(frame: .zero)
        backgroundColor = .clear
        titleLabel.text = title
        with(textView) {
            $0.backgroundColor = .clear
            $0.font = .interRegular(size: 15)
            $0.delegate = self
        }
        titleLabel.constraintHeight(constant: titleLabel.intrinsicContentSize.height)
        self.maxLength = maxLength
        if let height = height {
            heightConstraint = constraintHeight(constant: height)
        }
    }
    
    override public func setup() {
        super.setup()
        addSubviews(titleLabel, textView, errorLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        textView.do {
            $0.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 5))
            $0.constraintHeight(constant: 150)
            $0.viewCornerRadius = 8
            $0.viewBorderWidth = 1
            $0.borderColor = .primaryTextColor.withAlphaComponent(0.7)
            $0.clipsToBounds = true
            $0.contentInset = ._init(allEdges: 8)
        }
        errorLabel.do {
            $0.anchor(top: textView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: ._init(top: 4))
            $0.showView(false)
        }
    }
    
    func localizeUI(title: String) {
        titleLabel.text = title
    }
    
    var isValid: Bool { text.isNotEmpty }
    
    func showError(_ message: String) {
        errorLabel.do {
            $0.text = message
            if !errorLabelVisible {
                errorLabelVisible = true
                errorLabelHeightConstraint = $0.constraintHeight(constant: errorLabel.intrinsicContentSize.height)
                heightConstraint?.constant += errorLabelHeightConstraint!.constant
                _animate(duration: 0.2) { [weak self] in
                    self?.errorLabel.showView()
                    self?.updateTextFieldAppearance(success: false)
                    self?.layoutIfNeeded()
                }
            }
        }
        
    }
    
    func hideError() {
        if errorLabelVisible {
            errorLabelVisible = false
            heightConstraint?.constant -= (errorLabelHeightConstraint?.constant ?? 0)
            errorLabelHeightConstraint?.constant = 0
        }
        _animate(duration: 0.2) { [weak self] in
            self?.errorLabel.showView(false)
            self?.updateTextFieldAppearance()
            self?.layoutIfNeeded()
        }
    }
    
    fileprivate func updateTextFieldAppearance(success: Bool = true) {
        textView.do {
            $0.borderColor = success ? .primaryTextColor.withAlphaComponent(0.7) : .systemRed
            $0.textColor = success ? .primaryTextColor : .systemRed
            if !success {
                $0.shake(duration: 0.2)
            }
        }
    }
    
}

extension TBTextView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let maxLength = maxLength {
            return textView.restrictToMaximumLength(range: range, string: text, maxLength: maxLength)
        }
        return true
    }
}
