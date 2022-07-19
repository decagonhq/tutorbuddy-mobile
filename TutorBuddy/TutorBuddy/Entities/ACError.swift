//
//  ErrorModel.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation

struct ACError: Codable, Error {
    let code: Int?
    let message, error: String?
}
