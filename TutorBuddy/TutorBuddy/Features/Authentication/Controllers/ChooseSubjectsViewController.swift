//
//  ChooseSubjectsViewController.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 27/08/2022.
//

import UIKit
import BottomPopup

class ChooseSubjectsViewController: BottomPopupViewController {
    
    var subjects: [Subject]!
    var handleSelectedSubjectsSelected: (([Subject]) -> Void)?
    var selectedSubjects: [Subject] = [] {
        willSet {
            handleSelectedSubjectsSelected?(newValue)
        }
    }
    
    fileprivate let titleTextLabel = UILabel(text: "Choose a maximum of five (5) subjects only.", font: .interBold(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: true)
    fileprivate let closeImageView = UIImageView(image: R.image.close_icon(), tintColor: .primaryTextColor, size: 18)
    fileprivate lazy var titleStackView = HorizontalStackView(arrangedSubviews: [titleTextLabel, closeImageView], spacing: 10, alignment: .center)
    fileprivate lazy var contentTableView = UITableView(cell: SubjectTableViewCell.self, delegate: self, datasource: self, scrollable: true)
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

extension ChooseSubjectsViewController: UITableViewConformable {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subject = subjects[indexPath.row]
        return tableView.deque(cell: SubjectTableViewCell.self, at: indexPath).apply {
            $0.configure(with: subject, for: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? SubjectTableViewCell
        let selectedSubject = subjects[indexPath.row]
        cell?.checkBox.isChecked.toggle()
        if cell?.checkBox.isChecked == true {
            selectedSubjects.append(selectedSubject)
        } else {
            selectedSubjects.removeAll(where: { selectedSubject == $0 })
        }
    }
}
