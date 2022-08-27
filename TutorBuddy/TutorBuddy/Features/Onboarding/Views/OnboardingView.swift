//
//  OnboardingView.swift
//  TutorBuddy
//

import UIKit
import RxSwift

class OnboardingView: BaseView {

    fileprivate let onboardingItems = OnboardingItem.allCases
    var skipButtonTapHandler: NoParamHandler?
    var getStartedButtonTapHandler: NoParamHandler?
    var nextButtonTapHandler: ((Int) -> Void)?
    fileprivate let ONBOARDING_ITEM_CELL_ID = "OnboardingCollectionViewCell"
    fileprivate var currentPage = 0 {
        didSet {
            pageControls.currentPage = currentPage
        }
    }

    fileprivate lazy var onboardingItemsCollectionView: BaseCollectionView = {
        var height = 0.cgfloat
        switch DeviceManager.shared.screenSize {
        case .small:
            height = 500
        case .normal:
            height = 550
        case .large:
            height = 600
        }
        return BaseCollectionView(reuseIdentifier: ONBOARDING_ITEM_CELL_ID, cell: OnboardingCollectionViewCell.self, direction: .horizontal)
    }()
    fileprivate lazy var pageControls: UIPageControl = {
        UIPageControl(indicatorColor: .aTertiaryLabel, currentPageColor: .primaryColor, numberOfItems: onboardingItems.count)
    }()
    fileprivate lazy var skipButton: TBButton = {
        TBButton(title: .SKIP, font: .interRegular(size: 16), backgroundColor: .clear, textColor: .primaryTextColor, width: 70, tapAction: handleSkipButtonTapped)
    }()
    fileprivate lazy var nextButton: TBButton = {
        TBButton(title: .NEXT, textColor: .white, height: 50, tapAction: handleNextButtonTapped)
    }()
    fileprivate lazy var getStartedButton: TBButton = {
        TBButton(title: .GET_STARTED, textColor: .white, height: 50, tapAction: handleGetStartedButtonTapped)
    }()
    fileprivate lazy var bottomStackView: VerticalStackView = {
        VerticalStackView(arrangedSubviews: [nextButton, getStartedButton], distribution: .fill)
    }()
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        addSubviews(skipButton, onboardingItemsCollectionView, bottomStackView)
        setupConstraints()
        getStartedButton.showView(false)
        setupItemsCollectionView()
    }

    fileprivate func setupConstraints() {
        skipButton.anchor(top: topAnchor, trailing: trailingAnchor, padding: ._init(top: 20, right: 0))
        onboardingItemsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            onboardingItemsCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85),
            onboardingItemsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            onboardingItemsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingItemsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    
        bottomStackView.anchor(top: onboardingItemsCollectionView.bottomAnchor, leading: onboardingItemsCollectionView.leadingAnchor, trailing: onboardingItemsCollectionView.trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
    }

    fileprivate func setupItemsCollectionView() {
        onboardingItemsCollectionView.rx.setDelegate(self).disposed(by: disposeBag)

        onboardingItems.asObservable.map({ $0.isEmpty }).distinctUntilChanged().bind(to: onboardingItemsCollectionView.rx.isEmpty()).disposed(by: disposeBag)
        onboardingItems.asObservable.bind(to: onboardingItemsCollectionView.rx.items(cellIdentifier: ONBOARDING_ITEM_CELL_ID, cellType: OnboardingCollectionViewCell.self)) { row, item, cell in
            cell.configure(item: item)
        }.disposed(by: disposeBag)
    }

    fileprivate func handleGetStartedButtonTapped() {
        getStartedButtonTapHandler?()
    }

    fileprivate func handleSkipButtonTapped() {
        skipButtonTapHandler?()
    }

    fileprivate func handleNextButtonTapped() {
        if currentPage == onboardingItems.count - 2 {
            updateBottomViews(showGetStarted: true)
            showNextItem()
        } else {
            updateBottomViews(showGetStarted: false)
            showNextItem()
        }
    }

    fileprivate func showNextItem() {
        nextButtonTapHandler?(currentPage)
        currentPage += 1
        onboardingItemsCollectionView.scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .right, animated: true)
    }
    
    fileprivate func updateBottomViews(showGetStarted: Bool) {
        nextButton.showView(!showGetStarted)
        getStartedButton.showView(showGetStarted)
    }

    fileprivate func updateCurrentPage() {
        runAfter { [weak self] in
            guard let self = self else { return }
            if let indexPath = self.onboardingItemsCollectionView.indexPathsForVisibleItems.first {
                self.currentPage = indexPath.item
                self.updateBottomViews(showGetStarted: self.currentPage == self.onboardingItems.count - 1)
            }
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        onboardingItemsCollectionView.scrollToNearestVisibleCell()
        updateCurrentPage()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            onboardingItemsCollectionView.scrollToNearestVisibleCell()
            updateCurrentPage()
        }
    }

}

extension OnboardingView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
    
}
