//
//  CourseDetailsView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 10/08/2022.
//

import UIKit

class CourseDetailsView: BaseScrollView {
    
    var engageTutorButtonTapHandler: DoubleStringParamHandler?
    var viewModel: IDashBoardViewModel?
    var engageTutorButtonErrorHandler: NoParamHandler?
    var ratings: [String?]!
    
    var selectedDate: Date?
    var selectedTime: Date?
    
    let startDatePicker = UIDatePicker().apply {
        if #available(iOS 13.4, *) {
            $0.preferredDatePickerStyle = .wheels
        }
        $0.datePickerMode = .dateAndTime
        
    }
    
    let endDatePicker = UIDatePicker().apply {
        if #available(iOS 13.4, *) {
            $0.preferredDatePickerStyle = .wheels
        }
        $0.datePickerMode = .dateAndTime
    }
    
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
    lazy var startTimeField = TBTextField(title: .PICK_DATE).apply {
        $0.textField.inputView = startDatePicker
        addRightImageTo(field: $0, image: R.image.calendar_icon()!)
    }
    
    lazy var endTimeField = TBTextField(title: .PICK_TIME).apply {
        $0.textField.inputView = endDatePicker
        addRightImageTo(field: $0, image: R.image.calendar_icon()!)
    }
    
    fileprivate lazy var dateTimeStackView = VerticalStackView(arrangedSubviews: [startTimeField, endTimeField], spacing: 15)
    fileprivate let ratingsLabel = UILabel(text: "Ratings", font: .interExtraBold(size: 16), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var ratingsStackView = VerticalStackView(arrangedSubviews: [ratingsLabel], alignment: .leading)
    lazy var headerView = UIView(backgroundColor: .clear, borderWidth: 1, borderColor: .primaryGrey)
    lazy var ratingsTableView = UITableView(cell: RatingsTableViewCell.self, delegate: self, datasource: self, separatorStyle: .singleLine, separatorColor: .gray).withHeight(200).apply { $0.layer.borderWidth = 1; $0.layer.borderColor = UIColor.primaryGrey.cgColor }
    lazy var engageTutorButton = TBButton(title: "Engage Tutor", height: 50, isEnabled: false, tapAction: engageTutorButtonTapped)
    
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
        
        dateTimeStackView.do {
            _addSubview($0)
            $0.anchor(top: scheduleTimeStackView.bottomAnchor, leading: courseImageView.leadingAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }
        
        ratingsTableView.do {
            _addSubview($0)
            $0.anchor(top: dateTimeStackView.bottomAnchor, leading: courseImageView.leadingAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }
        
        engageTutorButton.do {
            _addSubview($0)
            $0.anchor(top: ratingsTableView.bottomAnchor, leading: courseImageView.leadingAnchor, bottom: _bottomAnchor, trailing: courseImageView.trailingAnchor, padding: ._init(top: 20))
        }
        
        headerView.addSubviews(ratingsStackView)
        
        ratingsStackView.fillSuperview(padding: ._init(allEdges: 10))
        
        startDatePicker.minimumDate = Date()
        endDatePicker.minimumDate = Date()
        startDatePicker.addTarget(self, action: #selector(startDatePickerTapped), for: .valueChanged)
        endDatePicker.addTarget(self, action: #selector(endDatePickerTapped), for: .valueChanged)
    }
    
    func configure(with course: RecommendedSubjectDetailsData) {
        with(course) {
            tutorNameLabel.text = $0.name
            numberOfCoursesLabel.text = ($0.noOfCourses?.string ?? 0.string) + " courses"
            tutorBioLabel.text = $0.bioNote
            ratingsLabel.text = "Ratings (\($0.tutorComments?.count ?? 0))"
            if let thumbnailUrl = $0.thumbnail, thumbnailUrl.isNotEmpty {
                courseImageView.setImageFromURL(url: thumbnailUrl, placeholderImage: R.image.chemistry_banner())
            }
        }
    }
    
    fileprivate func engageTutorButtonTapped() {
        guard startTimeField.text.isNotEmpty, endTimeField.text.isNotEmpty else { print("error"); engageTutorButtonErrorHandler?(); return }
        engageTutorButtonTapHandler?(startTimeField.text, endTimeField.text)
    }
    
    private func addRightImageTo(field: TBTextField, image: UIImage?){
        let dropButton = UIButton(type: .system)
        dropButton.frame = CGRect(x: 0, y: 5, width: frame.height, height: frame.height)
        if let image = image {
            dropButton.setImage(image, for: .normal)
        }
        dropButton.tintColor = .primaryGrey
        dropButton.contentEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 10)
        field.textField.rightView =  dropButton
        field.textField.rightViewMode = .always
    }
    
    @objc func startDatePickerTapped() {
        let date = startDatePicker.date
        selectedDate = date
        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm a"
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        startTimeField.textField.text = formatter.string(from: date)
    }
    
    @objc func endDatePickerTapped() {
        let date = endDatePicker.date
        selectedTime = date
        let formatter = DateFormatter()
//        formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm a"
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        endTimeField.textField.text = formatter.string(from: date)
        
        guard let startTime = startTimeField.textField.text, !(startTime.count == 0),
              let endTime = endTimeField.textField.text, !(endTime.count == 0)
        else {
            engageTutorButton.enable(false)
            return
        }
        engageTutorButton.enable()
    }
    
}

extension CourseDetailsView: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ratings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rating = ratings[indexPath.row]
        return tableView.deque(cell: RatingsTableViewCell.self, at: indexPath).apply {
            $0.configure(with: Rating(ratingTitle: nil, ratingSubtitle: rating))
        }
    }
    
    
}
