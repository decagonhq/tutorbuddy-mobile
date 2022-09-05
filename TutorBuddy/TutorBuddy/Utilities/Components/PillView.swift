//
//  PillView.swift
//  TutorBuddy
//

import UIKit

final class PillView: BaseView {

    let textLabel = UILabel(text: "", numberOfLines: 0, color: .white)
    let cancelImageView = UIImageView(image: R.image.launch_screen_logo(), tintColor: .white, size: 15)
    fileprivate lazy var contentStackView = HorizontalStackView(arrangedSubviews: [textLabel, cancelImageView], spacing: 8, alignment: .center)
    
    var text: String {
        get { textLabel.text.orEmpty }
        set { textLabel.text = newValue }
    }
    
    override func setup() {
        super.setup()
        with(contentStackView) {
            addSubview($0)
            $0.centerYInSuperview()
            $0.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: ._init(leftRight: 15))
        }
    }
    
    convenience init(backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 5, text: String, textColor: UIColor = .primaryTextColor, font: UIFont = .interRegular(size: 14), showCancel: Bool = false) {
        self.init(frame: .zero)
        setup()
        setBackgroundColor(backgroundColor)
        viewCornerRadius = cornerRadius
        with(textLabel) {
            $0.text = text
            $0.textColor = textColor
            $0.font = font
        }
        cancelImageView.showView(showCancel)
    }

}
