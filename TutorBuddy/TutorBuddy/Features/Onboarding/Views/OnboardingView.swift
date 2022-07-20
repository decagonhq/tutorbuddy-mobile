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
        return BaseCollectionView(reuseIdentifier: ONBOARDING_ITEM_CELL_ID, cell: OnboardingCollectionViewCell.self, direction: .horizontal/*, height: height*/)
    }()
    fileprivate lazy var pageControls: UIPageControl = {
        UIPageControl(indicatorColor: .aTertiaryLabel, currentPageColor: .primaryColor, numberOfItems: onboardingItems.count)
    }()
//    fileprivate lazy var skipButton: TBButton = {
//        TBButton(title: .SKIP, font: .interBold(size: 16), backgroundColor: .clear, textColor: .primaryTextColor, width: 70, tapAction: handleSkipButtonTapped)
//    }()
//    fileprivate lazy var nextButton: TBButton = {
//        TBButton(backgroundColor: .primaryColor, cornerRadius: 10, size: 50, image: R.image.launch_screen_logo(), tintColor: .white, tapAction: handleNextButtonTapped).apply {
//            $0.imageEdgeInsets = ._init(allEdges: 10)
//        }
//    }()
    fileprivate lazy var getStartedButton: TBButton = {
        TBButton(title: .GET_STARTED, textColor: .white, height: 50, tapAction: handleGetStartedButtonTapped)
    }()
    fileprivate lazy var bottomStackView: HorizontalStackView = {
        HorizontalStackView(arrangedSubviews: [getStartedButton], alignment: .center)
    }()
    
    override func setup() {
        super.setup()
        addSubviews(onboardingItemsCollectionView, getStartedButton)
        setupConstraints()
        setupItemsCollectionView()
    }

    fileprivate func setupConstraints() {
        onboardingItemsCollectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            onboardingItemsCollectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85),
            onboardingItemsCollectionView.topAnchor.constraint(equalTo: topAnchor),
            onboardingItemsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingItemsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    
        getStartedButton.anchor(top: onboardingItemsCollectionView.bottomAnchor, leading: onboardingItemsCollectionView.leadingAnchor, trailing: onboardingItemsCollectionView.trailingAnchor, padding: ._init(top: 30, left: 20, right: 20))
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

    fileprivate func updateBottomViews(showGetStarted: Bool) {
//        [skipButton, pageControls, nextButton].showViews(!showGetStarted)
//        getStartedButton.showView(showGetStarted)
    }

    fileprivate func showNextItem() {
        currentPage += 1
        onboardingItemsCollectionView.scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .right, animated: true)
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
