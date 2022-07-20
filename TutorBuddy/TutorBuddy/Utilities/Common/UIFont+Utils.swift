//
//  UIFont+Utils.swift
//  TutorBuddy
//

import UIKit

extension UIFont {
    class func interExtraBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Inter-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    class func interBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Inter-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    class func interRegular(size: CGFloat = 14) -> UIFont { UIFont(name: "Inter-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
}
