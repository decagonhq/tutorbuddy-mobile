//
//  BaseResponse.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let code: String?
    var data: T? = nil

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case data = "Object"
    }
}
