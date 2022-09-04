//
//  TutorHomeView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

//final class TutorHomeView: UIView {
//
//    lazy var newView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.1607843137, blue: 0.3490196078, alpha: 0.1018209652)
//        return view
//    }()
//
//    lazy var newViewStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .vertical
//        stack.spacing = 0
//        stack.alignment = .fill
//        stack.distribution = .fill
//        [self.greetingLabel, self.nameLabel].forEach { stack.addArrangedSubview($0) }
//        return stack
//    }()
//
//    lazy var greetingLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Welcome"
//        label.font = UIFont(name: "Helvetica Neue", size: 14)
//        return label
//    }()
//
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "John Doe"
//        label.font = UIFont.boldSystemFont(ofSize: 24)
//        return label
//    }()
//
//    lazy var requestLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "All Requests"
//        label.font = UIFont(name: "Helvetica Neue", size: 16)
//        return label
//    }()
//
//    lazy var homePageTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.separatorStyle = .none
//        tableView.register(CourseRequestCollectionViewCell.self, forCellReuseIdentifier: CourseRequestCollectionViewCell.identifier)
//        return tableView
//    }()
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupSubviews()
//        backgroundColor = .clear
//        self.translatesAutoresizingMaskIntoConstraints = false
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setupSubviews() {
//        [newView, requestLabel, homePageTableView].forEach { self.addSubview($0) }
//        newView.addSubview(newViewStackView)
//        NSLayoutConstraint.activate([
//            newView.topAnchor.constraint(equalTo: self.topAnchor),
//            newView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            newView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            newViewStackView.topAnchor.constraint(equalTo: newView.topAnchor, constant: 16),
//            newViewStackView.leadingAnchor.constraint(equalTo: newView.leadingAnchor, constant: 16),
//            newViewStackView.trailingAnchor.constraint(equalTo: newView.trailingAnchor, constant: -16),
//            newViewStackView.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -16),
//            requestLabel.topAnchor.constraint(equalTo: newView.bottomAnchor, constant: 24),
//            requestLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            homePageTableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 16),
//            homePageTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            homePageTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            homePageTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
//        ])
//    }
//}

//extension TutorHomeView: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CourseRequestCollectionViewCell.identifier, for: indexPath) as? CourseRequestCollectionViewCell else { return UITableViewCell()
//        }
//        cell.selectionStyle = .none
//        return cell
//    }
//}

final class TutorHomeView: BaseScrollView {
    
    fileprivate let welcomeLabel = UILabel(text: "Welcome", font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let userNameLabel = UILabel(text: "John Doe", font: .interExtraBold(size: 30), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var welcomeUserInfoStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, userNameLabel])
    fileprivate let topContainerView = UIView(height: 90, backgroundColor: .primaryColor.withAlphaComponent(0.1))
    fileprivate let allRequestsLabel = UILabel(text: "All Requests", font: .interExtraBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var courseRequestsTableView = UITableView(cell: CourseRequestCollectionViewCell.self, delegate: self, datasource: self)
    fileprivate lazy var courseRequestsStackView = VerticalStackView(arrangedSubviews: [allRequestsLabel, courseRequestsTableView], spacing: 8)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        topContainerView.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor)
        }
        
        welcomeUserInfoStackView.do {
            topContainerView.addSubview($0)
            $0.anchor(leading: topContainerView.leadingAnchor, padding: ._init(top: 20, left: 20))
            $0.centerYInSuperview()
        }
        
        courseRequestsStackView.do {
            _addSubview($0)
            $0.anchor(top: topContainerView.bottomAnchor, leading: topContainerView.leadingAnchor, trailing: topContainerView.trailingAnchor, padding: ._init(topBottom: 30, leftRight: 20))
        }
    }
}

extension TutorHomeView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.deque(cell: CourseRequestCollectionViewCell.self, at: indexPath)
    }
    
    
    
}
