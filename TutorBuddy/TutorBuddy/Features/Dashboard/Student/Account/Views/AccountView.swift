//
//  AccountView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 21/08/2022.
//

import UIKit

protocol AccountUpdatable {
    func update(with newName: String)
}

class AccountView: BaseView {
    
    fileprivate let items = AccountItem.items
    var signoutHandler: NoParamHandler?
    var editProfileHandler: NoParamHandler?
    lazy var tableView = UITableView(cell: AccountTableViewCell.self, delegate: self, datasource: self, scrollable: false)
    let userFullName = UILabel(text: "User", font: .interBold(size: 15), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var headerView = UIView(subviews: [avatarImageView, userFullName], height: 200, backgroundColor: .primaryGrey, borderWidth: 1, borderColor: .primaryGrey)
    fileprivate let avatarImageView = UIImageView(image: R.image.avatar_icon(), contentMode: .scaleAspectFill, height: 100)
    fileprivate let cameraIcon = UIImageView(image: R.image.camera_icon(), contentMode: .scaleAspectFit, size: 25, backgroundColor: .appBackground)
    
    fileprivate lazy var containerStackView = VerticalStackView(arrangedSubviews: [headerView, tableView])
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        with(containerStackView) {
            addSubview($0)
            $0.fillSuperview()
        }
        with(avatarImageView) {
            $0.centerInSuperview()
            $0.addSubview(cameraIcon)
            cameraIcon.anchor(bottom: $0.bottomAnchor, trailing: $0.trailingAnchor)
        }
        userFullName.centerXInSuperview()
        userFullName.anchor(top: avatarImageView.bottomAnchor, bottom: headerView.bottomAnchor, padding: ._init(top: 15))
        
        
    }
}

extension AccountView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        return tableView.deque(cell: AccountTableViewCell.self, at: indexPath).apply {
            $0.configure(with: item, at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.items.count - 1 {
            signoutHandler?()
        }
        
        if indexPath.row == 0 {
            editProfileHandler?()
        }
    }
}

