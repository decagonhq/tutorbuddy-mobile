//
//  NotificationView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 18/09/2022.
//

import UIKit

class NotificationView: BaseView {

    fileprivate lazy var notificationTableView = UITableView(cell: NotificationTableViewCell.self, delegate: self, datasource: self)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        with(notificationTableView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(top: 0, left: 20, right: 20))
        }
    }

}

extension NotificationView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.deque(cell: NotificationTableViewCell.self, at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}


