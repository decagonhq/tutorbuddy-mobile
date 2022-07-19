//
//  AppDropdownView.swift
//  Autochek DSA
//
//  Created by Folahanmi Kolawole on 13/07/2022.
//

import UIKit

class AppDropdownView: BaseView {
    
    fileprivate let HINT = "Choose Option"
    
    fileprivate let floatingLabel = UILabel(text: "Title", font: .interRegular(size: 14), numberOfLines: 1, color: .primaryTextColor, alignment: .left)
    let errorLabel = UILabel(text: "Required", font: .interRegular(size: 13), numberOfLines: 0, color: .systemRed, alignment: .left)
    fileprivate lazy var valueLabel: UILabel = {
        UILabel(text: HINT, font: .interRegular(size: 14), numberOfLines: 1, color: .aPlaceholderText, alignment: .left, adjustsFontSizeToFitWidth: false)
    }()
    fileprivate lazy var containerView: UIView = {
        UIView().apply {
            $0.borderColor = .primaryTextColor.withAlphaComponent(0.7)
            $0.viewBorderWidth = 1
            $0.viewCornerRadius = 5
            $0.constraintHeight(constant: 50)
            $0.addSubview(containerChildStackView)
            containerChildStackView.anchor(leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))
            containerChildStackView.centerYInSuperview()
        }
    }()
    fileprivate let iconImageView = UIImageView(image: UIImage(named: "chevron-left 4"))
    fileprivate lazy var containerStackView = with(VerticalStackView(arrangedSubviews: [floatingLabel, containerView, errorLabel], spacing: 8)) {
        $0.setCustomSpacing(4, after: containerView)
    }
    fileprivate lazy var containerChildStackView: HorizontalStackView = {
        HorizontalStackView(arrangedSubviews: [valueLabel, iconImageView], spacing: 10)
    }()
    
    public var floatingText: String {
        get { floatingLabel.text.orEmpty }
        set { floatingLabel.text = newValue }
    }
    
    public var valueText: String {
        get { valueLabel.text! == HINT ? "" : valueLabel.text! }
        set {
            let valueCheck = newValue.isEmpty || newValue == HINT
            valueLabel.text = valueCheck ? HINT : newValue
            valueLabel.textColor = valueCheck ? .aPlaceholderText : .aLabel
        }
    }
    
    convenience init(floatingText: String, valueText: String? = nil, iconImage: UIImage? = UIImage(named: "chevron-left 4")) {
        self.init(frame: .zero)
        setup()
        self.floatingText = floatingText
        self.valueText = valueText ?? HINT
        iconImageView.image = iconImage
    }
    
    override func setup() {
        super.setup()
        addSubview(containerStackView)
        containerStackView.fillSuperview()
        iconImageView.tintColor = .primaryTextColor
        iconImageView.constraintSize(height: 20, width: 20)
        errorLabel.showView(false)
    }
    
    var isValid: Bool {
        let valid = valueText.isNotEmpty
        errorLabel.showView(!valid)
        valueLabel.textColor = valid ? .aLabel : .systemRed
        containerView.do {
            $0.borderColor = valid ? .primaryTextColor.withAlphaComponent(0.7) : .systemRed
            if !valid {
                $0.shake(duration: 0.2)
            }
        }
        return valid
    }
    
}
