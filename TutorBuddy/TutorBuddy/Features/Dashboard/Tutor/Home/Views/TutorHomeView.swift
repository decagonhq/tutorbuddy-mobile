//
//  TutorHomeView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class TutorHomeView: BaseView {
    
    private let data = Constants.COURSE_REQUESTS
    
    fileprivate let welcomeLabel = UILabel(text: "Welcome", font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    let userNameLabel = UILabel(text: "", font: .interExtraBold(size: 25), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var welcomeUserInfoStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, userNameLabel])
    fileprivate let topContainerView = UIView(height: 90, backgroundColor: .primaryColor.withAlphaComponent(0.1))
    fileprivate let allRequestsLabel = UILabel(text: "All Requests", font: .interExtraBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var courseRequestsTableView = UITableView(cell: CourseRequestTableViewCell.self, delegate: self, datasource: self)
    fileprivate lazy var courseRequestsStackView = VerticalStackView(arrangedSubviews: [allRequestsLabel, courseRequestsTableView], spacing: 8)
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        topContainerView.do {
            addSubview($0)
            $0.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        }
        
        welcomeUserInfoStackView.do {
            topContainerView.addSubview($0)
            $0.anchor(leading: topContainerView.leadingAnchor, padding: ._init(top: 20, left: 20))
            $0.centerYInSuperview()
        }
        
        courseRequestsStackView.do {
            addSubview($0)
            $0.anchor(top: topContainerView.bottomAnchor, leading: topContainerView.leadingAnchor, bottom: bottomAnchor, trailing: topContainerView.trailingAnchor, padding: ._init(topBottom: 30, leftRight: 20))
        }
    }
}

extension TutorHomeView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let courseRequest = data[indexPath.item]
        return tableView.deque(cell: CourseRequestTableViewCell.self, at: indexPath).apply {
            $0.configure(with: courseRequest)
        }
    }
}
