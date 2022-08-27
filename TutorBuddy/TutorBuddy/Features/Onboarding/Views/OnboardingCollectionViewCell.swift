//
//  OnboardingCollectionViewCell.swift
//  TutorBuddy
//

import UIKit

class OnboardingCollectionViewCell: BaseCollectionViewCell {
    
    fileprivate let iconImageView = UIImageView(contentMode: .scaleAspectFit)
    fileprivate let titleLabel = UILabel(text: "", font: .interExtraBold(size: 34), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let subtitleLabel = UILabel(text: "", font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    
    override func setup() {
        super.setup()
        _addSubviews(iconImageView, titleLabel, subtitleLabel)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.65),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
        ])
        
        titleLabel.anchor(top: iconImageView.bottomAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: ._init(top: 20, left: 20, right: 20))
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: contentView.bottomAnchor, trailing: titleLabel.trailingAnchor, padding: ._init(top: 10))
    }
    
    func configure(item: OnboardingItem) {
        item.do {
            iconImageView.image = $0.icon
            titleLabel.text = $0.rawValue
            subtitleLabel.text = $0.subtitle
        }
    }
    
}
