//
//  RecommendedCoursesCollectionViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 07/08/2022.
//

import UIKit

final class RecommendedCoursesCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate let courseImageView = UIImageView(image: R.image.chemistry_banner(), contentMode: .scaleAspectFill, height: 100)
    fileprivate let courseNameLabel = UILabel(text: "N/A", font: .interExtraBold(size: 11), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let courseTutorLabel = UILabel(text: "N/A", font: .interRegular(size: 10), color: .primaryTextColor, alignment: .left)
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
    
    func configure(with course: Course) {
        with(course) {
            courseImageView.image = $0.avatarImage
            courseNameLabel.text = $0.courseName
            courseTutorLabel.text = "Adebukola Ayo"
            ratingIconTextView.text = $0.courseRating
            numberOfVotesLabel.text = "(48)"
        }
    }
}


