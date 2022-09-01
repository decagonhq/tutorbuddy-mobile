//
//  AccountTableViewCell.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 21/08/2022.
//

import UIKit

final class AccountTableViewCell: BaseTableViewCell {
    
    fileprivate let cellImageView = UIImageView(image: R.image.avatar_icon(), contentMode: .scaleAspectFill, size: 20)
    fileprivate let cellTitleLabel = UILabel(text: "", font: .interRegular(size: 15), color: .primaryTextColor, alignment: .left, adjustsFontSizeToFitWidth: false)
    fileprivate let switchView = UISwitch(frame: .zero).apply { $0.setOn(false, animated: true); $0.showView(false); $0.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged) }
    
    fileprivate lazy var contentStackView = HorizontalStackView(arrangedSubviews: [cellImageView, cellTitleLabel, switchView], spacing: 20)
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        with(contentStackView) {
            _addSubview($0)
            $0.fillSuperview(padding: ._init(allEdges: 20))
        }
    }
    
    func configure(with item: AccountItem, at index: Int) {
        with(item) {
            cellImageView.image = $0.icon
            cellTitleLabel.text = $0.title
            switchView.showView($0.shouldHaveSwitch)
            switchView.tag = index
        }
    }
    
    @objc func switchChanged(_ sender : UISwitch!){
           print("table row switch Changed \(sender.tag)")
           print("The switch is \(sender.isOn ? "ON" : "OFF")")
     }
}
