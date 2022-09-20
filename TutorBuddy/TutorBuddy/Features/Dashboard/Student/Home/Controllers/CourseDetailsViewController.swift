//
//  CourseDetailsViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 10/08/2022.
//

import UIKit
import DatePickerDialog

final class CourseDetailsViewController: BaseViewController<CourseDetailsView, IDashBoardViewModel> {
    
    var course: RecommendedSubject?
    var recommendedSubjectDetailsData: RecommendedSubjectDetailsData?
    var ratings: [String?]!
    
    var titleText: String = "Course Details"
    fileprivate lazy var titleTextLabel = UILabel(text: titleText, font: .interBold(size: 17), color: .primaryTextColor)
    fileprivate let closeImageView = UIImageView(image: R.image.close_icon(), tintColor: .primaryTextColor, size: 18)
    fileprivate lazy var titleStackView = HorizontalStackView(arrangedSubviews: [titleTextLabel, closeImageView], spacing: 10, alignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(.appBackground)
        viewModel.selectedRecommendedCourse = course
        kview.ratingsTableView.tableHeaderView = kview.headerView
        with(kview) {
            $0.engageTutorButtonErrorHandler = { [weak self] in
                self?.showMessage("make sure all neccessary fields are filled.", type: .error)
            }
            
            $0.engageTutorButtonTapHandler = { [weak self] startTime, endTime in
                print(startTime, endTime)
//                with(SuccessfulTutorRequestViewController().apply { $0.dismissHandler = { [weak self] in
//                    self?.dismissViewController(animated: true)
//                }}) {
//                    $0.modalPresentationStyle = .overFullScreen
//                    $0.setBackgroundColor()
//                    self?.present($0, animated: true)
//                }
                self?.viewModel.engageTutor(from: startTime, to: endTime)
            }
        }
    }
    
    override func setChildViewControllerObservers() {
        super.setChildViewControllerObservers()
        observeSessionStarted()
    }
    
    override func addSubviewConstraints() {
        super.addSubviewConstraints()
        titleStackView.do {
            addSubview($0)
            $0.anchor(top: safeAreaTopAnchor, leading: safeAreaLeadingAnchor, trailing: safeAreaTrailingAnchor, padding: ._init(leftRight: 20))
        }
    }
    
    override func configureViews() {
        super.configureViews()
        with(kview) {
            $0.ratings = ratings
            if let course = recommendedSubjectDetailsData {
                $0.configure(with: course)
            }
            
        }
        
        closeImageView.animateViewOnTapGesture { [weak self] in
            self?.dismissViewController()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderViewHeight(for: kview.ratingsTableView.tableHeaderView)
    }
    
    fileprivate func observeSessionStarted() {
        viewModel.showSessionStarted.bind { [weak self] show in
            if show {
                with(SuccessfulTutorRequestViewController().apply { $0.dismissHandler = { [weak self] in
                    self?.dismissViewController(animated: true)
                }}) {
                    $0.modalPresentationStyle = .overFullScreen
                    $0.setBackgroundColor()
                    self?.present($0, animated: true)
                }
                
            }
        }.disposed(by: disposeBag)
    }

    fileprivate func updateHeaderViewHeight(for header: UIView?) {
        guard let header = header else { return }
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: view.bounds.width - 32.0, height: 0)).height
    }
    
    fileprivate func showDatePickerDialog(for type: DateType = .scheduleTime, maxDate: Date?) {
        let dateFormat = "dd-MM-yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        let minDate = formatter.date(from: "01-01-1990")

        DatePickerDialog().show("Select Date", doneButtonTitle: "Ok", cancelButtonTitle: "Cancel", defaultDate: currentDate(format: "dd-MM-yyyy"), minimumDate: minDate, maximumDate: maxDate, datePickerMode: .date) { [weak self] date in
            if let date = date {
                self?.displayDate(for: type, value: date.toString(format: dateFormat))
            }
        }
    }
    
    private func displayDate(for type: DateType, value: String) {
        switch type {
        case .scheduleTime:
            kview.scheduleTimeIconText.text = value
        }
    }
}
