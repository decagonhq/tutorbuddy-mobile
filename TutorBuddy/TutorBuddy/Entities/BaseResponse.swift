//
//  BaseResponse.swift
//  TutorBuddy
//

import Foundation

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
    let roles: [String]?
}

struct TBRegisterResourceResponse: Codable {
    let success: Bool?
    let data: TBRegisterResourceData?
    let message: String?
    let statusCode: Int?
}

struct TBRegisterResourceData: Codable {
    let roles: [String]?
    let avaliabilities: [Day]?
    let subjects: [Subject]?
}

struct Day: Codable, Equatable {
    let id, day: String?
}

struct Subject: Codable, Equatable {
    let id, subject: String?
}

struct TBUserResponse: Codable {
    let success: Bool?
    let data: TBUserData?
    let message: String?
    let statusCode: Int?
}

struct TBUserData: Codable {
    let firstName, lastName, email, avatarUrl: String?
}
