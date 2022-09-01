//
//  NotificationTableViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class NotificationTableViewCell: UITableViewCell {
    
    static let identifier = "NotificationCell"
    
    lazy var newView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.6588235294, blue: 0, alpha: 0.05362934969)
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 22
        image.backgroundColor = .red
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "John Doe"
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Requested to learn JavaScript"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fill
        [self.nameLabel, self.descriptionLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "20 min ago"
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        contentView.addSubview(newView)
        //        contentView.backgroundColor = #colorLiteral(red: 0.07843137255, green: 0.6588235294, blue: 0, alpha: 0.05362934969)
        [profileImage, stackView, timeLabel].forEach { newView.addSubview($0) }
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            newView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            profileImage.topAnchor.constraint(equalTo: newView.topAnchor, constant: 8),
            profileImage.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 16),
            profileImage.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -16),
            profileImage.heightAnchor.constraint(equalToConstant: 46),
            profileImage.widthAnchor.constraint(equalToConstant: 46),
            stackView.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            stackView.centerYAnchor.constraint(equalTo: profileImage.centerYAnchor),
            timeLabel.topAnchor.constraint(equalTo: newView.topAnchor, constant: 14),
            timeLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -16),
        ])
    }
}
