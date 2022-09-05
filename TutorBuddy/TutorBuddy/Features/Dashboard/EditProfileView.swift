//
//  EditProfileView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 05/09/2022.
//

import UIKit

class EditProfileView: BaseView {

    var saveButtonTapHandler: DoubleStringParamHandler?
    
    let userFullName = UILabel(text: "User", font: .interBold(size: 15), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let avatarImageView = UIImageView(image: R.image.avatar_icon(), contentMode: .scaleAspectFill, height: 100)
    lazy var headerView = UIView(subviews: [avatarImageView, userFullName], height: 200, backgroundColor: .clear, borderColor: .primaryGrey)
    fileprivate let cameraIcon = UIImageView(image: R.image.camera_icon(), contentMode: .scaleAspectFit, size: 25, backgroundColor: .appBackground)
    lazy var nameTextfield = TBTextField(title: .NAME, placeholder: .YOUR_FULL_NAME, validationType: .name)
    let emailTextfield = TBTextField(title: .EMAIL, placeholder: .YOUR_EMAIL_ADDRESS, validationType: .email)
    fileprivate lazy var saveButton = TBButton(title: .SAVE, height: 50, tapAction: handleSaveButtonTapped)
    fileprivate lazy var textFieldStackView = VerticalStackView(arrangedSubviews: [nameTextfield, emailTextfield], spacing: 20)
    
    fileprivate lazy var containerStackView = VerticalStackView(arrangedSubviews: [headerView, textFieldStackView, saveButton])
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        with(containerStackView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(leftRight: 20))
        }
        with(avatarImageView) {
            $0.centerInSuperview()
            $0.addSubview(cameraIcon)
            cameraIcon.anchor(bottom: $0.bottomAnchor, trailing: $0.trailingAnchor)
        }
        userFullName.centerXInSuperview()
        userFullName.anchor(top: avatarImageView.bottomAnchor, bottom: headerView.bottomAnchor, padding: ._init(top: 15))
    }
    
    fileprivate func handleSaveButtonTapped() {
        if [nameTextfield, emailTextfield].areValid {
            saveButtonTapHandler?(nameTextfield.text, emailTextfield.text)
        }
    }
}
