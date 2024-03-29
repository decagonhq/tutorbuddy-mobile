//
//  HomeView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 27/07/2022.
//

import UIKit
import BottomPopup
import RxSwift

class StudentHomeView: BaseScrollView {
    
    var viewModel: IDashBoardViewModel?
    var seeAllButtonTapHandler: NoParamHandler?
    var courseSelectedHandler: ((RecommendedSubject, Int) -> Void)?
    var tutorSelectedHandler: ((FeaturedTutor, Int) -> Void)?
    
    fileprivate var data: [FeaturedTutor] {
        viewModel?.featuredTutors ?? []
    }
    
    private var _data: [RecommendedSubject] {
        viewModel?.recommendedSubjects ?? []
    }
    
    fileprivate let welcomeLabel = UILabel(text: "Welcome", font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    let userNameLabel = UILabel(text: "", font: .interExtraBold(size: 25), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var welcomeUserInfoStackView = VerticalStackView(arrangedSubviews: [welcomeLabel, userNameLabel])
    fileprivate let reminderButton = TBButton(backgroundColor: .clear, size: 40, image: R.image.clock_icon()?.withRenderingMode(.alwaysOriginal), tapAction: nil)
    let notificationButton = TBButton(backgroundColor: .clear, size: 40, image: R.image.unread_notification_icon()?.withRenderingMode(.alwaysOriginal), tapAction: nil)
    fileprivate lazy var iconsStackView = HorizontalStackView(arrangedSubviews: [reminderButton, notificationButton])
    fileprivate let searchBar = UISearchBar(placeholder: .SEARCH, showsCancelButton: false).apply {
        $0.updateAppearance(height: 50, radius: 5, backgroundColor: .white, borderWidth: 1, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.16))
    }
    
    fileprivate let topContainerView = UIView(height: 165, backgroundColor: .primaryColor.withAlphaComponent(0.1))
    fileprivate let featuredTutorsLabel = UILabel(text: "Featured Tutors", font: .interExtraBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var featuredTutorsCollectionView = BaseCollectionView(cell: FeaturedTutorsCollectionViewCell.self, direction: .horizontal, interitemSpacing: 0, height: 130, delegate: self, dataSource: self)
    fileprivate lazy var featuredTutorsStackView = VerticalStackView(arrangedSubviews: [featuredTutorsLabel, featuredTutorsCollectionView], spacing: 8)
    fileprivate let recommendedCoursesLabel = UILabel(text: "Recommended Courses", font: .interExtraBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var seeAllButton = TBButton(title: "See all", font: .interExtraBold(size: 15), backgroundColor: .clear, textColor: .primaryColor, tapAction: seeAllButtonTapped)
    fileprivate lazy var recommendedCoursesStackView = HorizontalStackView(arrangedSubviews: [recommendedCoursesLabel, seeAllButton])
    fileprivate lazy var recommendedCoursesCollectionView = BaseCollectionView(cell: RecommendedCoursesCollectionViewCell.self, direction: .vertical, lineSpacing: 20, height: 700, delegate: self, dataSource: self)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        topContainerView.do {
            _addSubview($0)
            $0.anchor(top: _topAnchor, leading: _leadingAnchor, trailing: _trailingAnchor)
        }
        
        welcomeUserInfoStackView.do {
            topContainerView.addSubview($0)
            $0.anchor(top: topContainerView.topAnchor, leading: topContainerView.leadingAnchor, padding: ._init(top: 20, left: 20))
        }
        
        iconsStackView.do {
            topContainerView.addSubview($0)
            $0.anchor(top: welcomeUserInfoStackView.topAnchor, trailing: topContainerView.trailingAnchor, padding: ._init(right: 20))
        }
        
        searchBar.do {
            topContainerView.addSubview($0)
            $0.anchor(leading: topContainerView.leadingAnchor, bottom: topContainerView.bottomAnchor, trailing: topContainerView.trailingAnchor, padding: ._init(topBottom: 20, leftRight: 20))
        }
        
        featuredTutorsStackView.do {
            _addSubview($0)
            $0.anchor(top: topContainerView.bottomAnchor, leading: topContainerView.leadingAnchor, trailing: topContainerView.trailingAnchor, padding: ._init(topBottom: 30, leftRight: 20))
        }
        
        recommendedCoursesStackView.do {
            _addSubview($0)
            $0.anchor(top: featuredTutorsStackView.bottomAnchor, leading: featuredTutorsStackView.leadingAnchor, trailing: featuredTutorsStackView.trailingAnchor, padding: ._init(top: 30))
        }
        
        recommendedCoursesCollectionView.do {
            _addSubview($0)
            $0.anchor(top: recommendedCoursesStackView.bottomAnchor, leading: _leadingAnchor, bottom: _bottomAnchor, trailing: _trailingAnchor, padding: ._init(top: 20, left: 20, right: 20))
        }
        
        setupBindings()
    }
    
    func setupBindings() {
        viewModel?.showFeaturedTutors.bind { [weak self] show in
            if show {
                self?.showFeaturedTutors()
            }
        }.disposed(by: disposeBag)
        
        viewModel?.showRecommendedSubjects.bind { [weak self] show in
            if show {
                self?.showRecommendedSubjects()
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showFeaturedTutors() {
        with(featuredTutorsCollectionView) {
            if data.isEmpty {
                $0.setEmptyMessage(viewModel?.noFeaturedTutorsMessage ?? "")
            } else {
                $0.restore()
            }
            $0.setContentOffset(.zero, animated: true)
            $0.reloadData()
        }
    }
    
    fileprivate func showRecommendedSubjects() {
        with(recommendedCoursesCollectionView) {
            if _data.isEmpty {
                $0.setEmptyMessage(viewModel?.noRecommendedCoursesMessage ?? "")
            } else {
                $0.restore()
            }
            $0.setContentOffset(.zero, animated: true)
            $0.reloadData()
        }
    }
    
    fileprivate func seeAllButtonTapped() {
        seeAllButtonTapHandler?()
    }
    
    fileprivate func handleCourseSelected(_ course: RecommendedSubject, at index: Int) {
        courseSelectedHandler?(course, index)
    }
    
    fileprivate func handleTutorSelected(_ tutor: FeaturedTutor, at index: Int) {
        tutorSelectedHandler?(tutor, index)
    }
    
}

extension StudentHomeView: UICollectionViewConformable {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == featuredTutorsCollectionView {
            return data.count
        } else {
            return _data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == featuredTutorsCollectionView {
            let tutor = data[indexPath.item]
            return collectionView.deque(cell: FeaturedTutorsCollectionViewCell.self, at: indexPath).apply {
                $0.configure(with: tutor)
                $0.containerView.animateViewOnTapGesture { [weak self] in
                    self?.handleTutorSelected(tutor, at: indexPath.row)
                }
            }
        } else {
            let course = _data[indexPath.item]
            return collectionView.deque(cell: RecommendedCoursesCollectionViewCell.self, at: indexPath).apply {
                $0.configure(with: course)
                $0.container.animateViewOnTapGesture { [weak self] in
                    self?.handleCourseSelected(course, at: indexPath.row)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == featuredTutorsCollectionView {
            return CGSize(width: 90, height: collectionView.frame.size.height)
        } else {
            return CGSize(width: (collectionView.frame.size.width / 2) - 10, height: 180)
        }
    }
    
}
