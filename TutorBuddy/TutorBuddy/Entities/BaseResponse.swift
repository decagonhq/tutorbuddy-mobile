//
//  BaseResponse.swift
//  TutorBuddy
//

import Foundation

//struct BaseResponse<T: Codable>: Codable {
//    let code: String?
//    var data: T? = nil
//
//    enum CodingKeys: String, CodingKey {
//        case code = "Code"
//        case data = "Object"
//    }
//}


//struct BaseResponsee<T: Codable>: Codable {
//    let success: Bool?
//    var data: T? = nil
//    let message: String?
//    let statusCode: Int?
//}

struct TBRegisterResponse: Codable {
    let success: Bool?
    let data: String?
    let message: String?
    let statusCode: Int?
}

struct TBBaseResponse: Codable {
    let success: Bool?
    let data: TBLoginData?
    let message: String?
    let statusCode: Int?
}

struct TBLoginData: Codable {
    let id, token, refreshToken: String?
}

//struct TBUserResponse: Codable {
//    let id, token, refreshToken: String?
//}
//
//struct BaseResponse: Codable {
//    let success: Bool?
//    let data: TBUserResponsee?
//    let message: String?
//    let statusCode: Int?
//}
//
//struct TBUserResponsee: Codable {
//    let roles: [String]?
//    let avaliabilities: [TBDay]?
//    let subjects: [TBSubject]
//}
//
//struct TBDay: Codable, Scopable {
//    let id, day: String?
//}
//
//struct TBSubject: Codable, Scopable {
//    let id, subject: String?
//}
