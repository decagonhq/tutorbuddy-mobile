//
//  RatingsTableViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 10/08/2022.
//

import UIKit

final class RatingsTableViewCell: BaseTableViewCell {

    fileprivate let titleLabel = UILabel(text: "N/A", font: .interBold(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let subtitleLabel = UILabel(text: "N/A", font: .interRegular(size: 13), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var contentStackView = VerticalStackView(arrangedSubviews: [titleLabel, subtitleLabel])
    
    override func setup() {
        super.setup()
        contentStackView.do {
            _addSubview($0)
            $0.fillSuperview(padding: ._init(allEdges: 10))
        }
    }
    
    func configure(with rating: Rating) {
        with(rating) {
            titleLabel.text = $0.ratingTitle ?? "Awesome tutor"
            subtitleLabel.text = $0.ratingSubtitle ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        }
    }
}
