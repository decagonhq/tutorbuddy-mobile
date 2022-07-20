//
//  BaseResponse.swift
//  TutorBuddy
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
