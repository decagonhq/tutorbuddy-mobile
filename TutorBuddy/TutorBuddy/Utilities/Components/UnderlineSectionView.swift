//
//  UnderlineSectionView.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 07/03/2022.
//

import UIKit

enum UnderlineSectionViewState {
    case active, inactive
    
    var textColor: UIColor {
        switch self {
        case .active:
            return .primaryTextColor
        case .inactive:
            return .aSecondaryLabel
        }
    }
}

final class UnderlineSectionView: BaseView {

    fileprivate let titleLabel = UILabel(text: "Section", font: .interRegular(size: 16), numberOfLines: 0, color: .primaryTextColor)
    fileprivate let underlineView = UIView(height: 5, backgroundColor: .primaryTextColor)
    fileprivate lazy var contentView = VerticalStackView(arrangedSubviews: [titleLabel, underlineView], spacing: 10)
    
    var title: String { titleLabel.text! }
    
    override func setup() {
        super.setup()
        setBackgroundColor(.clear)
        with(contentView) {
            addSubview($0)
            $0.fillSuperview()
        }
    }
    
    convenience init(title: String, state: UnderlineSectionViewState = .active) {
        self.init(frame: .zero)
        setup()
        titleLabel.text = title
        updateView(state: state)
    }
    
    func updateView(state: UnderlineSectionViewState) {
        titleLabel.textColor = state.textColor
        with(underlineView) {
            if state == .active {
                $0.fadeIn()
            } else {
                $0.fadeOut()
            }
        }
    }

}
