//
//  ChooseAvailabilityViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 27/08/2022.
//

import UIKit
import BottomPopup

class ChooseAvailabilityViewController: BottomPopupViewController {
    
    var days: [Day]!
    var handleSelectedDaysSelected: (([Day]) -> Void)?
    var selectedDays: [Day] = [] {
        willSet {
            handleSelectedDaysSelected?(newValue)
        }
    }
    
    fileprivate let titleTextLabel = UILabel(text: "Choose days available.", font: .interBold(size: 15), color: .primaryTextColor, alignment: .center, adjustsFontSizeToFitWidth: false)
    fileprivate let closeImageView = UIImageView(image: R.image.close_icon(), tintColor: .primaryTextColor, size: 18)
    fileprivate lazy var titleStackView = HorizontalStackView(arrangedSubviews: [titleTextLabel, closeImageView], spacing: 10, alignment: .center)
    fileprivate lazy var contentTableView = UITableView(cell: AvailabilityTableViewCell.self, delegate: self, datasource: self, scrollable: true)
    fileprivate lazy var contentStackView = VerticalStackView(arrangedSubviews: [titleStackView, contentTableView], spacing: 20)
                                                    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI() {
        setBackgroundColor(.appBackground)
        with(contentStackView) {
            addSubview($0)
            $0.fillSuperview(padding: ._init(allEdges: 20))
        }
        closeImageView.animateViewOnTapGesture { [weak self] in
            self?.dismissViewController()
        }
    }
    
    override var popupTopCornerRadius: CGFloat { 15 }
    
    override var popupHeight: CGFloat { 400 }
    
    override var popupPresentDuration: Double { 0.2 }
    
    override var popupDismissDuration: Double { 0.2 }
    
}

extension ChooseAvailabilityViewController: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let day = days[indexPath.row]
        return tableView.deque(cell: AvailabilityTableViewCell.self, at: indexPath).apply {
            $0.configure(with: day, for: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? AvailabilityTableViewCell
        let selectedDay = days[indexPath.row]
        cell?.checkBox.isChecked.toggle()
        if cell?.checkBox.isChecked == true {
            selectedDays.append(selectedDay)
        } else {
            selectedDays.removeAll(where: { selectedDay == $0 })
        }
    }
}
