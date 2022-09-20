//
//  MyCourseTableViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 20/09/2022.
//

import UIKit

typealias MyCourseActionClosure = ((ProgressStatus, RecommendedSubject) -> Void)

class MyCourseTableViewCell: BaseTableViewCell {

    fileprivate let courseImageView = CourseImageView().withHeight(180).apply { $0.clipsToBounds = true }
    fileprivate let courseNameLabel = UILabel(text: "Chemistry for beginners: 30 days perfection", font: .interExtraBold(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left)
    fileprivate let rateTutorLabel = UILabel(text: "Rate Tutor", font: .interBold(size: 15), numberOfLines: 1, color: .primaryTextColor).apply { $0.layer.cornerRadius = 17; $0.clipsToBounds = true; $0.constraintWidth(constant: 100); $0.constraintHeight(constant: 35); /*$0.backgroundColor = .primaryGrey*/ }
    fileprivate lazy var courseStackView = HorizontalStackView(arrangedSubviews: [courseNameLabel, rateTutorLabel])
    fileprivate let tutorNameLabel = UILabel(text: "Adebukola Ayo", font: .interRegular(size: 15), numberOfLines: 0, color: .primaryTextColor, alignment: .left)
    fileprivate let progressView = UIView(height: 5, backgroundColor: .primaryGrey, radius: 3)
    fileprivate let progressViewTwo = UIView(height: 5, width: 100, backgroundColor: .appGreen, radius: 3).apply { $0.showView(false) }
    fileprivate let progressViewThree = UIView(height: 5, backgroundColor: .appGreen, radius: 3).apply { $0.showView(false) }
    fileprivate let completedLabel = UILabel(text: "Your progress", font: .interRegular(size: 15), numberOfLines: 0, color: .systemGray, alignment: .left)
    fileprivate let separatorView = UIView(height: 30, backgroundColor: .clear)
    fileprivate lazy var containerView = UIView(subviews: [courseImageView, courseStackView, tutorNameLabel, progressView, progressViewTwo, progressViewThree, completedLabel])
    
    override func setup() {
        super.setup()
        contentView.setBackgroundColor(.clear)
        setBackgroundColor(.clear)
        with(containerView) {
            _addSubviews($0, separatorView)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor)
            courseImageView.anchor(top: $0.topAnchor, leading: $0.leadingAnchor, trailing: _trailingAnchor)
            courseStackView.anchor(top: courseImageView.bottomAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: ._init(topBottom: 15, leftRight: 10))
            tutorNameLabel.anchor(top: courseStackView.bottomAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: ._init(topBottom: 15, leftRight: 10))
            progressView.anchor(top: tutorNameLabel.bottomAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: ._init(topBottom: 15, leftRight: 10))
            progressViewTwo.anchor(top: tutorNameLabel.bottomAnchor, leading: $0.leadingAnchor, padding: ._init(topBottom: 15, leftRight: 10))
            progressViewThree.anchor(top: tutorNameLabel.bottomAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: ._init(topBottom: 15, leftRight: 10))
            completedLabel.anchor(top: progressView.bottomAnchor, leading: $0.leadingAnchor, trailing: $0.trailingAnchor, padding: ._init(topBottom: 5, leftRight: 10))
            
        }
        separatorView.anchor(top: containerView.bottomAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor)
    }
    
    func configure(with course: MyCourse, status: ProgressStatus, action: MyCourseActionClosure?) {
        course.do {
            if let thumbnailUrl  = $0.thumbnail, thumbnailUrl.isNotEmpty {
                courseImageView.imageView.setImageFromURL(url: thumbnailUrl)
            }
            courseNameLabel.text = $0.topic
            tutorNameLabel.text = $0.tutor
            
            let status = ProgressStatus(rawValue: $0.status ?? 0)
            if status == .completed {
                rateTutorLabel.backgroundColor = UIColor("#FCD635")
                completedLabel.text = "Complete"
                progressViewThree.showView()
            } else {
                rateTutorLabel.backgroundColor = .primaryGrey
                completedLabel.text = "Your progress"
                progressViewTwo.showView()

            }
        }
    }

}
