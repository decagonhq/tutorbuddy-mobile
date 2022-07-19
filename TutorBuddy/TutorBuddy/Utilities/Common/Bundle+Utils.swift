//
//  Bundle+Utils.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import UIKit

extension Bundle {
    
    func value<T>(for key: String) -> T? {
        object(forInfoDictionaryKey: key) as? T
    }
    
    var baseURL: String { value(for: "BASE_URL")! }
    
}
