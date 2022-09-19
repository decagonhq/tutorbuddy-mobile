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

struct TBFeaturedTutorsResponse: Codable {
    let success: Bool?
    let data: [FeaturedTutor]?
    let message: String?
    let statusCode: Int?
}

struct TBRefreshTokenResponse: Codable {
    let success: Bool?
    let data: TBRefreshTokenData?
    let message: String?
    let statusCode: Int?
}

struct TBRefreshTokenData: Codable, Scopable {
    let newAccessToken, newRefreshToken: String?
}

struct TBRecommendedSubjectsResponse: Codable {
    let success: Bool?
    let data: TBRecommendedSubjectsData?
    let message: String?
    let statusCode: Int?
}

struct TBRecommendedSubjectsData: Codable {
    let pageItems: [RecommendedSubject]?
    let pagination: Pagination?
}

struct RecommendedSubject: Codable, Scopable {
    let id, subject, thumbnail, description, tutorSubjectId, tutor, tutorImage: String?
    let rating, userCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, subject, thumbnail, description, tutorSubjectId, tutor, tutorImage, userCount, rating = "rate"
    }
}

struct Pagination: Codable, Scopable {
    let totalNumberOfPages, currentPage, pageSize, previousPage: Int?
}

struct TBRecommendedSubjectCategoryResponse: Codable {
    let success: Bool?
    let data: TBRecommendedSubjectCategoryData?
    let message: String?
    let statusCode: Int?
}

struct TBRecommendedSubjectCategoryData: Codable {
    let pageItems: [RecommendedSubjectCategory]?
    let pagination: Pagination?
}

enum SubjectCategorySection {
    case basicScience([RecommendedSubject])
    case programmingLanguage([RecommendedSubject])
    
    var items: [RecommendedSubject] {
        switch self {
        case .basicScience(let items),
                .programmingLanguage(let items):
            return items
        }
    }
    
    var count: Int { items.count }
    
    var localized: String {
        switch self {
        case .basicScience:
            return "Basic Science"
        case .programmingLanguage:
            return "Programming Language"
        }
    }
}

struct RecommendedSubjectCategory: Codable, Scopable {
    let categoryId, categoryName: String?
    let subject: [RecommendedSubject]?
}

struct TBRecommendedSubjectDetailsResponse: Codable {
    let success: Bool?
    let data: TBRecommendedSubjectDetailsData?
    let message: String?
    let statusCode: Int?
}

struct TBRecommendedSubjectDetailsData: Codable, Scopable {
    let topic, thumbnail, description, name, avatar, bioNote, unitOfPrice, createdAt: String?
    let rating, noOfCourses, price: Int?
    let tutorComments: [String?]?
}

struct RecommendedSubjectDetailsData: Scopable {
    let topic, thumbnail, description, name, avatar, bioNote, unitOfPrice, createdAt: String?
    let rating, noOfCourses, price: Int?
    let tutorComments: [String?]?
}

struct TBFeaturedTutorDetailsResponse: Codable {
    let success: Bool?
    let data: TBFeaturedTutorDetailsData?
    let message: String?
    let statusCode: Int?
}

struct TBFeaturedTutorDetailsData: Codable, Scopable {
    let fullName, avatar, bioNote: String?
    let subject, avaliabilities: [String]?
}

struct DashboardData: Codable, Scopable {
    let userDetails: TBUserData?
    let featuredTutors: [FeaturedTutor]?
    let recommendedSubjects: [RecommendedSubject]?
}
