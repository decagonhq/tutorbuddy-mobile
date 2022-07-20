//
//  Bundle+Utils.swift
//  TutorBuddy
//

import UIKit

extension Bundle {
    
    func value<T>(for key: String) -> T? {
        object(forInfoDictionaryKey: key) as? T
    }
    
    var baseURL: String { value(for: "BASE_URL")! }
    
}
