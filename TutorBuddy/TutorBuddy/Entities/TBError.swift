//
//  ErrorModel.swift
//  TutorBuddy
//

import Foundation

struct TBError: Codable, Error {
    let success: Bool?
    let data: AnyStruct?
    let message: String?
    let statusCode: Int?
}

struct _TBError: Codable, Error {
    let status: Int?
    let errors: Errors?
    let type, title, traceId: String?
}

struct Errors: Codable {
    let Password, EmailAddress: [String]?
}
