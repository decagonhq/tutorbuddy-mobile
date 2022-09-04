//
//  TutorAccountView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class TutorAccountView: UIView {
    
    var logoutTapped: (()-> Void)?
    var editTapped: (()-> Void)?
    var notificationTapped: (()-> Void)?
    var changePasswordTapped: (()-> Void)?
    var editImageTapped: (()-> Void)?

    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1550922005)
        return view
    }()
    
    lazy var viewTitleLabel: UILabel = {
        let viewTitle = UILabel()
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.textAlignment = .center
        viewTitle.text = "Profile"
        viewTitle.font = UIFont.boldSystemFont(ofSize: viewTitle.font.pointSize)
        return viewTitle
    }()
    
    lazy var profileImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.0327676786)
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 45
        image.backgroundColor = .red
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Chinonye Ndubueze"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        return label
    }()
    
    lazy var editProfileImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration.init(pointSize: 15), forImageIn: .normal)
        button.tintColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(editImageTap), for: .touchUpInside)
        return button
    }()
    
    lazy var editProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.backgroundColor = .red
        return image
    }()
    
    lazy var editProfileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Edit Profile"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(editTap))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var editProfileStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .fill
        [self.editProfileImage, self.editProfileLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var notificationProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.backgroundColor = .red
        return image
    }()
    
    lazy var notificationProfileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Notification"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(notificationTap))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var notificationProfileStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .fill
        [self.notificationProfileImage, self.notificationProfileLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var changePasswordProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.backgroundColor = .red
        return image
    }()
    
    lazy var changePasswordProfileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Change Password"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(changePasswordTap))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var changePasswordProfileStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .fill
        [self.changePasswordProfileImage, self.changePasswordProfileLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var logoutProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        image.widthAnchor.constraint(equalToConstant: 16).isActive = true
        image.backgroundColor = .red
        return image
    }()
    
    lazy var logoutProfileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Logout"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoutTap))
        label.addGestureRecognizer(tap)
        return label
    }()
    
    lazy var logoutProfileStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .fill
        [self.logoutProfileImage, self.logoutProfileLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var notificationToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.setOn(true, animated: true)
        return toggle
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func logoutTap() {
        logoutTapped?()
    }
    
    @objc func editTap() {
        editTapped?()
    }
    
    @objc func notificationTap() {
        notificationTapped?()
    }
    
    @objc func changePasswordTap() {
        logoutTapped?()
    }
    
    @objc func editImageTap() {
        editImageTapped?()
    }
    
    func setupSubviews() {
        [topView, lineView, profileImageView,
         editProfileStackView, notificationProfileStackView,
         changePasswordProfileStackView, logoutProfileStackView, notificationToggle].forEach { self.addSubview($0) }
        topView.addSubview(viewTitleLabel)
        [profileImage, nameLabel, editProfileImageButton].forEach { profileImageView.addSubview($0) }
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.topAnchor),
            topView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            topView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 48),
            viewTitleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            viewTitleLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -8),
            lineView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            profileImageView.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 187),
            profileImage.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 32),
            profileImage.heightAnchor.constraint(equalToConstant: 90),
            profileImage.widthAnchor.constraint(equalToConstant: 90),
            editProfileImageButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor),
            editProfileImageButton.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            nameLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: -32),
            editProfileStackView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 32),
            editProfileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            notificationProfileStackView.topAnchor.constraint(equalTo: editProfileStackView.bottomAnchor, constant: 35),
            notificationProfileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            notificationToggle.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 75),
            notificationToggle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            changePasswordProfileStackView.topAnchor.constraint(equalTo: notificationProfileStackView.bottomAnchor, constant: 35),
            changePasswordProfileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            logoutProfileStackView.topAnchor.constraint(equalTo: changePasswordProfileStackView.bottomAnchor, constant: 35),
            logoutProfileStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ])
    }
//}
}
