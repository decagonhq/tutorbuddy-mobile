//
//  TutorDetailsViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 09/08/2022.
//

import UIKit
import BottomPopup
import RxSwift

final class TutorDetailsViewController: BottomPopupViewController {
    
    var tutor: TBFeaturedTutorDetailsData?
    var titleText: String = "Tutor Profile"
    fileprivate let disposeBag = DisposeBag()
    
    fileprivate lazy var titleTextLabel = UILabel(text: titleText, font: .interBold(size: 17), color: .primaryTextColor)
    fileprivate let closeImageView = UIImageView(image: R.image.close_icon(), tintColor: .primaryTextColor, size: 18)
    fileprivate lazy var titleStackView = HorizontalStackView(arrangedSubviews: [titleTextLabel, closeImageView], spacing: 10, alignment: .center)
    
    fileprivate let avatarImageView = UIImageView(image: R.image.avatar_icon(), height: 80, width: 80, cornerRadius: 40)
    fileprivate let tutorNameLabel = UILabel(text: "N/A", font: .interExtraBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let certificationLabel = IconTextView(text: "Certified Tutor", font: .interRegular(size: 15), placeholderIcon: R.image.certified_icon(), iconTextAlignment: .iconLeft, iconSize: 20, textColor: .gray, textAlignment: .left, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    fileprivate let locationLabel = IconTextView(text: "Lagos, Nigeria", font: .interRegular(size: 15), placeholderIcon: R.image.location_icon(), iconTextAlignment: .iconLeft, iconSize: 20, textColor: .gray, textAlignment: .left, contentStackAlignment: .center, contentSpacing: 5).apply { $0.backgroundColor = .clear }
    fileprivate lazy var tutorBioStackView = VerticalStackView(arrangedSubviews: [tutorNameLabel, certificationLabel, locationLabel], spacing: 5)
    fileprivate lazy var tutorBioTopView = HorizontalStackView(arrangedSubviews: [avatarImageView, tutorBioStackView], spacing: 15)
    
    fileprivate let aboutLabel = UILabel(text: "About", font: .interExtraBold(size: 13), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let aboutTextView = UILabel(text: "N/A", font: .interRegular(size: 13), numberOfLines: 0, color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate lazy var tutorBioMiddleView = VerticalStackView(arrangedSubviews: [aboutLabel, aboutTextView], spacing: 5)
    
    fileprivate let expertiseLabel = UILabel(text: "Expertise", font: .interExtraBold(size: 13), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let coursePillView = HorizontalStackView(arrangedSubviews: [], distribution: .fillEqually)
    fileprivate lazy var _tutorBioMiddleView = VerticalStackView(arrangedSubviews: [expertiseLabel, coursePillView], spacing: 20)
    
    fileprivate lazy var contentView = VerticalStackView(arrangedSubviews: [titleStackView, tutorBioTopView, tutorBioMiddleView, _tutorBioMiddleView], distribution: .equalSpacing)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        if let tutor = tutor {
            configure(with: tutor)
        }
    }
    
    fileprivate func setupUI() {
        setBackgroundColor()
        
        with(contentView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(top: 25, left: 20, bottom: 40, right: 20))
        }
        closeImageView.animateViewOnTapGesture { [weak self] in
            self?.dismissViewController()
        }
    }
    
    fileprivate func configure(with tutor: TBFeaturedTutorDetailsData) {
        with(tutor) {
            tutorNameLabel.text = $0.fullName
            aboutTextView.text = $0.bioNote
            tutor.subject?.enumerated().forEach({ (idx, _subject) in
                coursePillView.addArrangedSubview(UILabel(text: _subject, font: .interRegular(size: 13), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false).apply { $0.backgroundColor = .primaryGrey; $0.constraintHeight(constant: 30); $0.layer.cornerRadius = 10; $0.clipsToBounds = true; })
                coursePillView.setCustomSpacing(15, after: coursePillView.subviews[idx])
            })
            if let avatarUrl = $0.avatar, avatarUrl.isNotEmpty {
                avatarImageView.setImageFromURL(url: avatarUrl, placeholderImage: R.image.avatar_icon())
            }
        }
    }
    
    override var popupTopCornerRadius: CGFloat { 15 }
    
    override var popupHeight: CGFloat { 400 }
    
    override var popupPresentDuration: Double { 0.2 }
    
    override var popupDismissDuration: Double { 0.2 }
}
