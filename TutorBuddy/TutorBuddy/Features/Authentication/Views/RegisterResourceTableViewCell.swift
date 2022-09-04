//
//  RegisterResourceTableViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 28/08/2022.
//

import UIKit

class SubjectTableViewCell: BaseTableViewCell {
    
    var selectedSubjects = [Subject]()

    let checkBox = Checkbox(checkboxFillColorState: .appBackground, borderStyle: .circle, checkmarkStyle: .circle, checkmarkColor: .primaryColor, checkedBorderColor: .primaryColor, uncheckedBorderColor: .aSecondaryLabel, isChecked: false, size: 50).apply { $0.isEnabled = false }
    fileprivate let cellLabel = UILabel(text: "Mathematics", font: .interRegular(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let separatorView = UIView(height: 10, backgroundColor: .clear)
    fileprivate lazy var contentStackView = HorizontalStackView(arrangedSubviews: [checkBox, cellLabel], spacing: 10)
    fileprivate lazy var bottomContentStackView = HorizontalStackView(arrangedSubviews: [separatorView])
    fileprivate lazy var stack = VerticalStackView(arrangedSubviews: [contentStackView, bottomContentStackView])
    
    override func setup() {
        super.setup()
        with(stack) {
            _addSubview($0)
            $0.fillSuperview()
        }
        checkBox.addTarget(self, action: #selector(checkBoxTapped), for: .valueChanged)
    }
    
    func configure(with subject: Subject, for indexPath: Int) {
        with(subject) {
            cellLabel.text = $0.subject
        }
    }
    
    fileprivate func activate(_ activate: Bool) {
        checkBox.isChecked = activate
    }
    
    @objc func checkBoxTapped() {
        
    }
    

}


class AvailabilityTableViewCell: BaseTableViewCell {
    
    var selectedDays = [Day]()

    let checkBox = Checkbox(checkboxFillColorState: .appBackground, borderStyle: .circle, checkmarkStyle: .circle, checkmarkColor: .primaryColor, checkedBorderColor: .primaryColor, uncheckedBorderColor: .aSecondaryLabel, isChecked: false, size: 50).apply { $0.isEnabled = false }
    fileprivate let cellLabel = UILabel(text: "Mathematics", font: .interRegular(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let separatorView = UIView(height: 10, backgroundColor: .clear)
    fileprivate lazy var contentStackView = HorizontalStackView(arrangedSubviews: [checkBox, cellLabel], spacing: 10)
    fileprivate lazy var bottomContentStackView = HorizontalStackView(arrangedSubviews: [separatorView])
    fileprivate lazy var stack = VerticalStackView(arrangedSubviews: [contentStackView, bottomContentStackView])
    
    override func setup() {
        super.setup()
        with(stack) {
            _addSubview($0)
            $0.fillSuperview()
        }
        checkBox.addTarget(self, action: #selector(checkBoxTapped), for: .valueChanged)
    }
    
    func configure(with availability: Day, for indexPath: Int) {
        with(availability) {
            cellLabel.text = $0.day
        }
    }
    
    fileprivate func activate(_ activate: Bool) {
        checkBox.isChecked = activate
    }
    
    @objc func checkBoxTapped() {
        
    }
    

}
