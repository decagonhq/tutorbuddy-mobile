//
//  CourseRequestCollectionViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

//class CourseRequestCollectionViewCell: UITableViewCell {
//
//    static let identifier = "CourseRequestCell"
//
//    lazy var newView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
//        view.layer.shadowOpacity = 0.1
//        view.layer.masksToBounds = false
//        return view
//    }()
//
//    lazy var imageHolder: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = R.image.chemistry_banner()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFill
//        imageView.backgroundColor = .red
//        return imageView
//    }()
//
//    lazy var newLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "New"
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.numberOfLines = 0
//        label.backgroundColor = #colorLiteral(red: 1, green: 0.2702214122, blue: 0.4223161936, alpha: 1)
//        label.textAlignment = .center
//        label.textColor = .white
//        return label
//    }()
//
//    lazy var courseTitle: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Learn Coding in Python Development Fundermental"
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    lazy var nameStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.spacing = 8
//        stack.alignment = .fill
//        stack.distribution = .fill
//        [self.nameImage, self.nameLabel].forEach { stack.addArrangedSubview($0) }
//        return stack
//    }()
//
//    lazy var nameImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFill
//        image.backgroundColor = .red
////        image.image = UIImage(systemName: "mail.fill")
////        image.tintColor = .black
//        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        image.layer.cornerRadius = 8
//        return image
//    }()
//
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Chukwudi Kamdibe"
//        label.font = UIFont(name: "Helvetica Neue", size: 12)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    lazy var dateStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.spacing = 8
//        stack.alignment = .fill
//        stack.distribution = .fill
//        [self.dateImage, self.dateLabel].forEach { stack.addArrangedSubview($0) }
//        return stack
//    }()
//
//    lazy var dateImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFill
//        image.image = UIImage(systemName: "clock.arrow.circlepath")
//        image.tintColor = .black
//        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        image.layer.cornerRadius = 8
//        return image
//    }()
//
//    lazy var dateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "July 26 - 30, 2022"
//        label.font = UIFont(name: "Helvetica Neue", size: 12)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    lazy var statusStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.spacing = 10
//        stack.alignment = .fill
//        stack.distribution = .fill
//        [self.statusImage, self.statusLabel].forEach { stack.addArrangedSubview($0) }
//        return stack
//    }()
//
//    lazy var statusImage: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.contentMode = .scaleAspectFill
//        image.image = UIImage(systemName: "checkmark.circle.fill")
//        image.tintColor = .systemOrange
//        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        image.layer.cornerRadius = 8
//        return image
//    }()
//
//    lazy var statusLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "In Progress"
//        label.textColor = .systemOrange
//        label.font = UIFont(name: "Helvetica Neue", size: 12)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    lazy var stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.spacing = 6
//        stack.alignment = .fill
//        stack.distribution = .fill
//        [self.nameStackView, self.dateStackView, self.statusStackView].forEach { stack.addArrangedSubview($0) }
//        return stack
//    }()
//
//    lazy var statusButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Status", for: .normal)
//        button.layer.cornerRadius = 6
//        let color: UIColor = .black
//        button.setTitleColor(color, for: .normal)
//        button.backgroundColor = .clear
//        button.layer.borderWidth = 1
//        button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        button.widthAnchor.constraint(equalToConstant: 58).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 27).isActive = true
//        return button
//    }()
//
//    lazy var rateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Rate Student"
//        label.textColor = .lightGray
//        label.font = UIFont(name: "Helvetica Neue", size: 12)
//        label.numberOfLines = 0
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupSubviews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupSubviews() {
//        contentView.addSubview(newView)
//        [imageHolder, courseTitle, newLabel,
//         stackView, statusButton, rateLabel].forEach { newView.addSubview($0) }
//        NSLayoutConstraint.activate([
//            newView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            newView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
//            imageHolder.topAnchor.constraint(equalTo: newView.topAnchor),
//            imageHolder.leadingAnchor.constraint(equalTo: newView.leadingAnchor),
//            imageHolder.trailingAnchor.constraint(equalTo: newView.trailingAnchor),
//            imageHolder.heightAnchor.constraint(equalToConstant: 163),
//            imageHolder.widthAnchor.constraint(equalToConstant: 343),
//            newLabel.topAnchor.constraint(equalTo: imageHolder.topAnchor, constant: 16),
//            newLabel.leadingAnchor.constraint(equalTo: imageHolder.leadingAnchor, constant: 16),
//            newLabel.heightAnchor.constraint(equalToConstant: 23),
//            newLabel.widthAnchor.constraint(equalToConstant: 41),
//            courseTitle.topAnchor.constraint(equalTo: imageHolder.bottomAnchor, constant: 50),
//            courseTitle.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 16),
//            courseTitle.trailingAnchor.constraint(equalTo: statusButton.leadingAnchor, constant: -58),
//            statusButton.lastBaselineAnchor.constraint(equalTo: courseTitle.lastBaselineAnchor),
//            statusButton.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -22),
//            stackView.topAnchor.constraint(equalTo: courseTitle.bottomAnchor, constant: 16),
//            stackView.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 16),
//            stackView.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -16),
//            rateLabel.topAnchor.constraint(equalTo: courseTitle.bottomAnchor, constant: 16),
//            rateLabel.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -22)
//        ])
//    }
//}

final class CourseRequestCollectionViewCell: BaseTableViewCell {
    
    
}
