//
//  CourseDetailsView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 10/08/2022.
//

import UIKit

class CourseDetailsView: BaseScrollView {
    
    var engageTutorButtonTapHandler: NoParamHandler?
    
    fileprivate let courseImageView = UIImageView(image: R.image.physics_banner(), contentMode: .scaleAspectFill, height: 160)
    fileprivate let aboutTheTutorLabel = UILabel(text: "About the Tutor", font: .interExtraBold(size: 16), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let underline = UIView(height: 1, backgroundColor: .primaryGrey)
    fileprivate lazy var aboutTutorStackView = VerticalStackView(arrangedSubviews: [aboutTheTutorLabel, underline])
    
    fileprivate let avatarImageView = UIImageView(image: R.image.avatar_icon(), width: 80, cornerRadius: 40)
    fileprivate let tutorNameLabel = UILabel(text: "N/A", font: .interBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let numberOfCoursesLabel = UILabel(text: "N/A", font: .interRegular(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var tutorCoursesInfoStackView = VerticalStackView(arrangedSubviews: [tutorNameLabel, numberOfCoursesLabel])
    fileprivate lazy var tutorBioHeaderStackView = HorizontalStackView(arrangedSubviews: [avatarImageView, tutorCoursesInfoStackView], spacing: 15)
    
    fileprivate let tutorBioLabel = UILabel(text: "N/A", font: .interRegular(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var tutorBioFooterStackView = HorizontalStackView(arrangedSubviews: [tutorBioLabel])
    fileprivate lazy var tutorBioStackView = VerticalStackView(arrangedSubviews: [tutorBioHeaderStackView, tutorBioFooterStackView], spacing: 15)
    
    let scheduleTimeIconText = IconTextView(text: "Schedule Time", font: .interExtraBold(size: 16), placeholderIcon: R.image.calendar_icon(), iconTint: .primaryColor, iconTextAlignment: .iconLeft, iconSize: 30, textColor: .primaryColor, textAlignment: .left, contentStackDistribution: .equalCentering, contentStackAlignment: .center, contentSpacing: 5)
    fileprivate lazy var scheduleTimeStackView = VerticalStackView(arrangedSubviews: [scheduleTimeIconText], alignment: .leading)
    
    fileprivate let ratingsLabel = UILabel(text: "Ratings (6)", font: .interExtraBold(size: 16), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var ratingsStackView = VerticalStackView(arrangedSubviews: [ratingsLabel], alignment: .leading)
    lazy var headerView = UIView(backgroundColor: .clear, borderWidth: 1, borderColor: .primaryGrey)
    lazy var ratingsTableView = UITableView(cell: RatingsTableViewCell.self, delegate: self, datasource: self, separatorStyle: .singleLine, separatorColor: .gray).withHeight(200).apply { $0.layer.borderWidth = 1; $0.layer.borderColor = UIColor.primaryGrey.cgColor }
    
    
    lazy var engageTutorButton = TBButton(title: "Engage Tutor", height: 50, tapAction: engageTutorButtonTapped)
    
    override func setup() {
        setBackgroundColor(.clear)
        super.setup()
        courseImageView.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor, padding: ._init(topBottom: 70, leftRight: 20))
        }
        
        aboutTutorStackView.do {
            _addSubview($0)
            $0.anchor(top: courseImageView.bottomAnchor, leading: courseImageView.leadingAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 50))
        }

        tutorBioStackView.do {
            _addSubview($0)
            $0.anchor(top: aboutTutorStackView.bottomAnchor, leading: courseImageView.leadingAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }

        scheduleTimeStackView.do {
            _addSubview($0)
            $0.anchor(top: tutorBioStackView.bottomAnchor, leading: courseImageView.leadingAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }
        
        ratingsTableView.do {
            _addSubview($0)
            $0.anchor(top: scheduleTimeStackView.bottomAnchor, leading: courseImageView.leadingAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }
        
        engageTutorButton.do {
            _addSubview($0)
            $0.anchor(top: ratingsTableView.bottomAnchor, leading: courseImageView.leadingAnchor, bottom: _bottomAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }
        
        headerView.addSubviews(ratingsStackView)
        ratingsStackView.fillSuperview(padding: ._init(allEdges: 10))
    }
    
    
    func configure(with course: Course) {
        with(course) {
            courseImageView.image = $0.avatarImage
            tutorNameLabel.text = "Chukwudi Kamdibe"
            numberOfCoursesLabel.text = "62 courses"
            tutorBioLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. At nibh quam odio sit vestibulum sagittis urna."
        }
    }
    
    fileprivate func engageTutorButtonTapped() {
        engageTutorButtonTapHandler?()
    }
}

extension CourseDetailsView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.deque(cell: RatingsTableViewCell.self, at: indexPath).apply {
            $0.configure(with: Rating(ratingTitle: nil, ratingSubtitle: nil))
        }
    }
    
    
}
