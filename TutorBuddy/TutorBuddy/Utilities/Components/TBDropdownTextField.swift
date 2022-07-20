//
//  ACDropdownTextfield.swift
//  TutorBuddy
//

import Foundation
import UIKit
import DropDown

public class TBDropdownTextField: BaseView {
    
    fileprivate let hintText: String = .CHOOSE
    
    fileprivate let floatingLabel = UILabel(text: "Title", font: .interRegular(size: 14), numberOfLines: 1, color: .primaryTextColor, alignment: .left)
    fileprivate lazy var valueLabel: UILabel = {
        UILabel(text: hintText, font: .interRegular(size: 15), numberOfLines: 1, color: .aPlaceholderText, alignment: .left)
    }()
    lazy var containerView: UIView = {
        UIView().apply {
            $0.borderColor = .primaryTextColor.withAlphaComponent(0.7)
            $0.viewBorderWidth = 1
            $0.viewCornerRadius = 6
            $0.constraintHeight(constant: 50)
            $0.addSubview(containerChildStackView)
            containerChildStackView.anchor(top: nil, leading: $0.leadingAnchor, bottom: nil, trailing: $0.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 0, right: 15))
            containerChildStackView.centerYInSuperview()
        }
    }()
    fileprivate let iconImageView = UIImageView(image: R.image.launch_screen_logo(), tintColor: .primaryTextColor, size: 12)
    fileprivate lazy var containerStackView: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [floatingLabel, containerView], spacing: 5)
    }()
    fileprivate lazy var containerChildStackView: HorizontalStackView = {
        HorizontalStackView(arrangedSubviews: [valueLabel, iconImageView], spacing: 10, alignment: .center)
    }()
    fileprivate lazy var dropdownView: DropDown = {
        DropDown().apply {
            $0.dataSource = selectionItems
            $0.textFont = .interRegular(size: 16)
            $0.selectionAction = { [weak self] index, value in
                self?.valueLabel.text = value
                self?.itemSelectionHandler?(value, index)
            }
        }
    }()
    
    var selectionItems = [String]() {
        didSet {
            dropdownView.dataSource = selectionItems
        }
    }
    private var itemSelectionHandler: StringIntParamHandler?
    
    public var floatingText: String {
        get { floatingLabel.text.orEmpty }
        set { floatingLabel.text = newValue }
    }
    
    public var valueText: String {
        get { valueLabel.text! == hintText ? "" : valueLabel.text! }
        set {
            let valueCheck = newValue.isEmpty || newValue == hintText
            valueLabel.text = valueCheck ? hintText : newValue
            valueLabel.textColor = valueCheck ? .aPlaceholderText : .aLabel
        }
    }
    
    public convenience init(floatingText: String, valueText: String? = nil, iconImage: UIImage? = UIImage(named: "arrow_down_icon")) {
        self.init(frame: .zero)
        setup()
        self.floatingText = floatingText
        self.valueText = valueText ?? hintText
        self.iconImageView.image = iconImage
    }
    
    convenience init(floatingText: String, valueText: String? = nil, items: [String], itemSelectionHandler: StringIntParamHandler? = nil) {
        self.init(frame: .zero)
        setup()
        self.floatingText = floatingText
        self.valueText = valueText ?? hintText
        selectionItems = items
        self.itemSelectionHandler = itemSelectionHandler
        animateViewOnTapGesture(completion: showItems)
    }
    
    fileprivate func showItems() {
        dropdownView.apply {
            $0.anchorView = containerView
            $0.width = containerView.width
            $0.show()
        }
    }
    
    public override func setup() {
        super.setup()
        addSubview(containerStackView)
        containerStackView.fillSuperview()
    }
    
    public var isValid: Bool {
        let valid = valueText.isNotEmpty
        if !valid {
            shake()
        }
        return valid
    }
    
}
