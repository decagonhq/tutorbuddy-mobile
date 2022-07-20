//
//  ErrorModel.swift
//  TutorBuddy
//

import Foundation

struct ACError: Codable, Error {
    let code: Int?
    let message, error: String?
}
