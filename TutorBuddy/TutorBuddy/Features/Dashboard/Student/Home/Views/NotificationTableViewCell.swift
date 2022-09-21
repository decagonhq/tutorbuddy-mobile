//
//  NotificationTableViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class NotificationTableViewCell: BaseTableViewCell {
    
    fileprivate let avatarImageView = UIImageView(image: R.image.avatar_icon(), height: 60, width: 60, cornerRadius: 30)
    fileprivate let nameLabel = UILabel(text: "John Doe", font: .interBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let timeLabel = UILabel(text: "20 mins ago.", font: .interRegular(size: 13), color: .systemGray, alignment: .right, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var topStackView = HorizontalStackView(arrangedSubviews: [nameLabel, timeLabel])
    fileprivate let detailsLabel = UILabel(text: "Has accepted your study request.", font: .interRegular(size: 13), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var bottomStackView = HorizontalStackView(arrangedSubviews: [detailsLabel])
    fileprivate lazy var containerView = UIView(subviews: [avatarImageView, topStackView, bottomStackView])
    fileprivate let separatorView = UIView(height: 20, backgroundColor: .appBackground)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.appGreen.withAlphaComponent(0.08))
        with(containerView) {
            _addSubviews($0, separatorView)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor)
            avatarImageView.anchor(top: $0.topAnchor, leading: $0.leadingAnchor, padding: ._init(top: 10, left: 10))
            topStackView.anchor(top: avatarImageView.topAnchor, leading: avatarImageView.trailingAnchor, trailing: $0.trailingAnchor, padding: ._init(left: 10, right: 10))
            bottomStackView.anchor(top: topStackView.bottomAnchor, leading: topStackView.leadingAnchor, bottom: avatarImageView.bottomAnchor, trailing: $0.trailingAnchor)
        }
        separatorView.anchor(top: containerView.bottomAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor)
    }
}
