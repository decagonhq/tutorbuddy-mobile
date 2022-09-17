//
//  RecommendedCoursesCollectionViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 07/08/2022.
//

import UIKit

final class RecommendedCoursesCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate let courseImageView = UIImageView(image: R.image.chemistry_banner(), contentMode: .scaleAspectFill, height: 90)
    fileprivate let courseNameLabel = UILabel(text: "N/A", font: .interExtraBold(size: 12), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)//.apply { $0.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical) }
    fileprivate let courseTutorLabel = UILabel(text: "N/A", font: .interRegular(size: 11), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)//.apply { $0.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical) }
    fileprivate let ratingIconTextView = IconTextView(text: "N/A", font: .interRegular(size: 13), placeholderIcon: R.image.star_icon(), iconTextAlignment: .iconRight, iconSize: 15, textColor: .primaryTextColor, textAlignment: .left, contentStackDistribution: .fill, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    fileprivate let numberOfVotesLabel = UILabel(text: "N/A", font: .interRegular(size: 13), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var ratingsStackView = HorizontalStackView(arrangedSubviews: [ratingIconTextView, numberOfVotesLabel]).apply { $0.setCustomSpacing(10, after: ratingIconTextView) }
    
    fileprivate lazy var labelsStackView = VerticalStackView(arrangedSubviews: [courseNameLabel, courseTutorLabel, ratingsStackView], distribution: .equalSpacing)
    fileprivate lazy var containerView = VerticalStackView(arrangedSubviews: [courseImageView, labelsStackView], spacing: 10)
    fileprivate lazy var container = UIView(subviews: [courseImageView, labelsStackView], backgroundColor: .white)
    
    override func setup() {
        super.setup()
        _addSubview(container)
        with(container) {
            $0.fillSuperview()
            courseImageView.anchor(top: $0.topAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor)
            labelsStackView.anchor(top: courseImageView.bottomAnchor, leading: $0.leadingAnchor, bottom: $0.bottomAnchor, trailing: $0.trailingAnchor, padding: ._init(topBottom: 10, leftRight: 8))
        }
    }
    
    func configure(with subject: RecommendedSubject) {
        with(subject) {
            courseNameLabel.text = $0.subject.orEmpty + ": " + $0.description.orEmpty
            courseTutorLabel.text = $0.tutor
            ratingIconTextView.text = $0.rating?.string
            numberOfVotesLabel.text = $0.userCount?.string
            if let thumbnailUrl = $0.thumbnail, thumbnailUrl.isNotEmpty {
                courseImageView.setImageFromURL(url: thumbnailUrl, placeholderImage: R.image.chemistry_banner())
            }
        }
    }
}


