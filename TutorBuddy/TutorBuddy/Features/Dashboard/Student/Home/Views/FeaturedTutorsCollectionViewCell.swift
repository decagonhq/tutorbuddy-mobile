//
//  FeaturedTutorsCollectionViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 04/08/2022.
//

import UIKit

class FeaturedTutorsCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate let avatarImageView = UIImageView(image: R.image.avatar_icon(), height: 80, width: 80, cornerRadius: 40)
    fileprivate let tutorName = UILabel(text: "N/A", font: .interRegular(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let ratingsIconText = IconTextView(text: "N/A", font: .interBold(), placeholderIcon: R.image.star_icon(), iconTextAlignment: .iconLeft, iconSize: 15, textColor: .primaryTextColor, textAlignment: .left, contentStackDistribution: .equalCentering, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    lazy var containerView = VerticalStackView(arrangedSubviews: [avatarImageView, tutorName, ratingsIconText], spacing: 5, alignment: .center)
    
    override func setup() {
        super.setup()
        addSubview(containerView)
        with(containerView) {
            $0.fillSuperview()
        }
    }
    
    func configure(with featuredTutor: FeaturedTutor) {
        with(featuredTutor) {
            tutorName.text = $0.fullName?.components(separatedBy: " ").first
            ratingsIconText.text = $0.rating?.string
            if let avatarUrl = $0.avatar, avatarUrl.isNotEmpty {
                avatarImageView.setImageFromURL(url: avatarUrl, placeholderImage: R.image.avatar_icon())
            }
        }
    }
}
