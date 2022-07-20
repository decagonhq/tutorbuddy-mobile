//
//  NumberProgressView.swift
//  TutorBuddy
//

import UIKit
import AttributedStringBuilder

class NumberProgressView: BaseView {
    
    
    
    fileprivate let leftLine = UIView(height: 1, backgroundColor: .gray)
    fileprivate let rightLine = UIView(height: 1, backgroundColor: .gray)
    fileprivate let circleTextView = UITextView(height: 36, width: 36, backgroundColor: .white, borderWidth: 1, borderColor: .gray, radius: 18).apply { $0.textAlignment = .center; $0.isEditable = false; $0.alignTextVerticallyInContainer() }
    fileprivate lazy var contentContainerView = UIView(subviews: [leftLine, circleTextView, rightLine], height: 36)
    
    
    convenience init(numerator: String = "", denominator: String = "", font: UIFont = .interBold(size: 12), textColor: UIColor = .primaryTextColor, textAlignment: NSTextAlignment = .center) {
        self.init(frame: .zero)
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let attrText = AttributedStringBuilder()
            .text(numerator + "/" + denominator, attributes: [.font(font), .textColor(textColor), .paragraphStyle(style)])
            .attributedString
        
        circleTextView.apply {
            $0.attributedText = attrText
            $0.font = font
        }
        
        addSubview(contentContainerView)
        contentContainerView.do {
            $0.fillSuperview()
            
            leftLine.anchor(leading: $0.leadingAnchor, trailing: circleTextView.leadingAnchor, padding: ._init(right: 10))
            leftLine.centerYInSuperview()
            
            circleTextView.centerInSuperview()
            
            rightLine.anchor(leading: circleTextView.trailingAnchor, trailing: $0.trailingAnchor, padding: ._init(left: 10))
            rightLine.centerYInSuperview()
        }
    }
}
