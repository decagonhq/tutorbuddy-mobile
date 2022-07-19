//
//  Constants.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import Foundation
import UIKit

struct Constants {
    static let DATA_NOT_FOUND = "No Data Found!"
    
    static let PHONE_CODES = ["+234", "+233", "+254"]
    
    static func MAX_PHONE_NUMBER_LENGTH(code: String = "+234") -> Int {
        switch code {
        case "+234", "NG":
            return 10
        case "+233", "GH", "+254", "KE":
            return 9
        default:
            return 10
        }
    }
    
    static func COUNTRY_FLAG(code: String = "+234") -> UIImage? {
        switch code {
        case "+234", "NG":
            return UIImage(named: "nig_icon")
        case "+233", "KE":
            return UIImage(named: "ke_ios")
        case "+254", "GH":
            return UIImage(named: "gh_ios")
        default:
            return UIImage(named: "nig_icon")
        }
    }
    
    static let CAR_ENGINE_TYPES = ["2-cylinder(I2)", "3-cylinder(I3)", "4-cylinder(I4)", "5-cylinder(I5)", "6-cylinder(I6)", "6-cylinder(V6)", "8-cylinder(V8)", "10-cylinder(V10)", "12-cylinder(V12)", "4-cylinder(H4)", "6-cylinder(H6)", "8-cylinder(I8)", "12-cylinder(V12)", "18-cylinder(V18)", "24-cylinder(V24)", "48-cylinder(V48)"]
    
    static let YEARS = Array(2000...currentYear().int!).reversed().map { $0.string }
}
