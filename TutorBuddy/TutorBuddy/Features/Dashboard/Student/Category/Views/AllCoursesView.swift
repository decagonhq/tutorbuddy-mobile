//
//  AllCoursesView.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 17/09/2022.
//

import UIKit

final class AllCoursesView: BaseView {
    
    var viewModel: IDashBoardViewModel?
    
    fileprivate var allCoursesCategories: [RecommendedSubjectCategory] {
        viewModel?.allCoursesCategories ?? []
    }
    
    fileprivate let searchBar = UISearchBar(placeholder: .SEARCH, showsCancelButton: false).apply {
        $0.updateAppearance(height: 50, radius: 5, backgroundColor: .white, borderWidth: 1, borderColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.16))
    }
    
    fileprivate lazy var allCoursesCollectionView = BaseCollectionView(cell: RecommendedCoursesCollectionViewCell.self, direction: .vertical, lineSpacing: 20, /*height: 700,*/ delegate: self, dataSource: self)
    
    fileprivate lazy var contentStackView = VerticalStackView(arrangedSubviews: [searchBar, allCoursesCollectionView], spacing: 20)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        with(contentStackView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(leftRight: 20))
        }
        
        setupBindings()
    }
    
    func setupBindings() {
        viewModel?.showAllCoursesCategories.bind { [weak self] show in
            if show {
                self?.showAllCoursesCategories()
            }
        }.disposed(by: disposeBag)
    }
    
    fileprivate func showAllCoursesCategories() {
        with(allCoursesCollectionView) {
            if allCoursesCategories.isEmpty {
                $0.setEmptyMessage(viewModel?.noFeaturedTutorsMessage ?? "")
            } else {
                $0.restore()
            }
            $0.setContentOffset(.zero, animated: true)
            $0.reloadData()
        }
    }
}

extension AllCoursesView: UICollectionViewConformable {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        allCoursesCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        allCoursesCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = allCoursesCategories[indexPath.item]
        return collectionView.deque(cell: RecommendedCoursesCollectionViewCell.self, at: indexPath).apply {_ in
//            $0.configure(with: course)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 2) - 10, height: 180)
    }
    
}
