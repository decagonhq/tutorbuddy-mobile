//
//  FilterableItemsViewController.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 12/03/2022.
//

import UIKit
import BottomPopup
import RxSwift

final class FilterableItemsViewController: BottomPopupViewController {

    fileprivate let tableView = UITableView().apply {
        $0.showsVerticalScrollIndicator = false
    }
    fileprivate let searchBar = UISearchBar().apply {
        $0.searchBarStyle = .minimal
        $0.placeholder = .SEARCH
        $0.font = .interRegular(size: 15)
    }
    fileprivate let titleLabel = UILabel(text: "Choose Item", font: .interRegular(size: 16), color: .primaryTextColor, alignment: .center)
    fileprivate let disposeBag = DisposeBag()
    
    var itemSelectionHandler: IntStringParamHandler?
    var itemName = ""
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews(tableView, searchBar, titleLabel)
        configureViews()
        setupTableView()
    }
    
    fileprivate func configureViews() {
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 10, bottom: 0, right: 10))
        searchBar.anchor(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
        tableView.anchor(top: searchBar.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: view.bottomAnchor, trailing: titleLabel.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 40, right: 0))
        titleLabel.text = .CHOOSE + " " + itemName
    }
    
    fileprivate func setupTableView() {
        let cellId = "FilterableItemTableViewCell"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        let rxFilterText = searchBar.rx.text.orEmpty.distinctUntilChanged()
        Observable.combineLatest(items.asObservable, rxFilterText) { filters, searchText -> [String] in
            guard searchText.isNotEmpty else { return filters }
            
            return filters.filter {
                $0.lowercased().replacingOccurrences(of: " ", with: "").contains(searchText.lowercased())
            }
            
        }.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: UITableViewCell.self)) { index, item, cell in
            cell.textLabel?.apply {
                $0.text = item
                $0.font = .interRegular(size: 15)
            }
            
            cell.animateViewOnTapGesture { [weak self] in
                self?.itemSelectionHandler?(index, item)
                self?.dismiss(animated: true)
            }
            
        }.disposed(by: disposeBag)
        
    }
    
    override var popupHeight: CGFloat { UIScreen.main.bounds.height - 200 }
    
    override var popupTopCornerRadius: CGFloat { 20 }

}
