//
//  CourseRequestCollectionViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 01/09/2022.
//

import UIKit

final class CourseRequestTableViewCell: BaseTableViewCell {
    
    fileprivate let courseStatusPillView = PillView(backgroundColor: .primaryColor, text: "New", textColor: .appBackground).withHeight(25)
    fileprivate let courseImageView = CourseImageView().withHeight(180).apply { $0.clipsToBounds = true }
    fileprivate let courseNameLabel = UILabel(text: "", font: .interExtraBold(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left)
    fileprivate lazy var courseRequestStatusPillView = PillView(text: "Status").withHeight(30).withWidth(70).apply { $0.viewBorderWidth = 1 }
    fileprivate let studentNameIconTextView = IconTextView(text: "", font: .interRegular(size: 13), placeholderIcon: R.image.avatar_icon(), iconTextAlignment: .iconLeft, iconSize: 20, textColor: .primaryTextColor, textAlignment: .left, contentStackDistribution: .fill, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    fileprivate lazy var rateStudentButton = TBButton(title: "Rate Student", font: .interBold(size: 13), backgroundColor: .clear, height: 20, tapAction: rateStudentButtonTapped)
    fileprivate let dateIconTextView = IconTextView(text: "", font: .interRegular(size: 13), placeholderIcon: R.image.time_icon(), iconTextAlignment: .iconLeft, iconSize: 20, textColor: .primaryTextColor, textAlignment: .left, contentStackDistribution: .fill, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    fileprivate let progressIconTextView = IconTextView(text: "", font: .interRegular(size: 13), placeholderIcon: R.image.in_progress_icon(), iconTextAlignment: .iconLeft, iconSize: 20, textColor: UIColor("#FFC107"), textAlignment: .left, contentStackDistribution: .fill, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    
    fileprivate lazy var courseNameStackView = HorizontalStackView(arrangedSubviews: [courseNameLabel, courseRequestStatusPillView], spacing: 10, distribution: .fillProportionally)
    fileprivate lazy var studentNameStackView = HorizontalStackView(arrangedSubviews: [studentNameIconTextView, rateStudentButton], distribution: .equalCentering)
    fileprivate lazy var dateStackView = HorizontalStackView(arrangedSubviews: [dateIconTextView])
    fileprivate lazy var isCompletedStackView = HorizontalStackView(arrangedSubviews: [progressIconTextView])
    fileprivate lazy var containerView = UIView(subviews: [courseImageView, courseNameStackView, bottomContentStackView])
    fileprivate lazy var bottomContentStackView = VerticalStackView(arrangedSubviews: [studentNameStackView, dateStackView, isCompletedStackView], spacing: 8)
    fileprivate lazy var containerStackView = VerticalStackView(arrangedSubviews: [containerView, UIView.spacer(20)])

    
    override func setup() {
        super.setup()
        contentView.setBackgroundColor(.clear)
        setBackgroundColor(.clear)
        containerStackView.do {
            _addSubview($0)
            $0.fillSuperview(padding: ._init(allEdges: 5))
        }
        
        courseImageView.do {
            $0.addSubview(courseStatusPillView)
            courseStatusPillView.anchor(top: $0.topAnchor, leading: $0.leadingAnchor, padding: ._init(topBottom: 10, leftRight: 10))
        }
        
        
        containerView.do {
            courseImageView.anchor(top: $0.topAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor)
            courseNameStackView.anchor(top: courseImageView.bottomAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: ._init(top: 10, left: 10, right: 10))
            bottomContentStackView.anchor(top: courseNameStackView.bottomAnchor, leading: courseNameStackView.leadingAnchor, bottom: $0.bottomAnchor, trailing: courseNameStackView.trailingAnchor, padding: ._init(topBottom: 10))
        }
    }
    
    fileprivate func rateStudentButtonTapped() {
        
    }
    
    func configure(with courseRequest: CourseRequest) {
        with(courseRequest) {
            courseImageView.imageView.image = $0.avatarImage
            courseNameLabel.text = $0.courseName
            studentNameIconTextView.text = $0.studentName
            dateIconTextView.text = $0.courseDuration
            progressIconTextView.text = $0.progressStatus == .inProgress ? "In progress" : "Completed"
            progressIconTextView.icon = $0.progressStatus == .inProgress ? R.image.in_progress_icon() : R.image.success_icon()
            progressIconTextView.textColor = $0.progressStatus == .inProgress ? UIColor("#FFC107") : .appGreen
            rateStudentButton.isEnabled = $0.progressStatus == .inProgress ? false : true
            rateStudentButton.textColor = $0.progressStatus == .inProgress ? .lightGray : .primaryColor
        }
    }
}
