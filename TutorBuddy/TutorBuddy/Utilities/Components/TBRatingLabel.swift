//
//  ACRatingLabel.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import UIKit

class TBRatingLabel: BaseView {
    
    fileprivate lazy var starImageView: UIImageView = {
        UIImageView().apply {
            $0.constraintSize(constant: 23)
        }
    }()
    
    fileprivate lazy var label: UILabel = {
        UILabel().apply {
            $0.numberOfLines = 1
            $0.textAlignment = .left
        }
    }()

    override func setup() {
        super.setup()
        let stackview = HorizontalStackView(arrangedSubviews: [starImageView, label], spacing: 4, alignment: .center)
        addSubview(stackview)
        stackview.fillSuperview()
    }
    
    convenience init(text: String, font: UIFont = .interBold(size: 15), textColor: UIColor = .primaryTextColor, image: UIImage? = UIImage(named: "star_filled_icon"), imageTintColor: UIColor = .primaryColor) {
        self.init(frame: .zero)
        setup()
        starImageView.apply {
            $0.image = image
            $0.tintColor = imageTintColor
        }
        label.apply {
            $0.font = font
            $0.textColor = textColor
            $0.text = text
        }
    }
    
    var text: String {
        get { label.text.orEmpty }
        set { label.text = newValue }
    }

}
