//
//  RemotePath.swift
//  TutorBuddy
//

import Foundation

enum RemotePath {
    
    case login, register, requestOTP, verifyOTP, resetPassword, updateUser, refreshToken
    case featuredTutors, recommendedSubjects, allSubjectsCategories, recommendedSubjectDetails(String), featuredTutorDetails(String)
    case session, studentSession(String), tutorSession(String)
    case documentUpload, imageUpload
    case carMakes, carModels, auctionDetails(String)
    case user(String), myLocation, colors, states, cities, bodyTypes, franchise
    case inspectionRequest, inventoryCarOffer, sourcingOverview, inspectionRequestStatus, inspectionRequestDetails(String)
    
    var desc: String {
        switch self {
        case .login:
            return "Auth/login"
        case .register:
            return "Auth/register"
        case .requestOTP:
            return "Auth/forgot-password"
        case .verifyOTP:
            return "Auth/verify-email"
        case .resetPassword:
            return "Auth/reset-password"
        case .updateUser:
            return "User/update-user"
        case .refreshToken:
            return "Auth/refresh-token"
        case .featuredTutors:
            return "Tutor/get-feature-tutors"
        case .recommendedSubjects:
            return "Tutor/get-all-recommend-subject"
        case .allSubjectsCategories:
            return "Tutor/get-all-subject-with-categories"
        case .recommendedSubjectDetails(let tutorSubjectId):
            return "Subject/\(tutorSubjectId)"
        case .featuredTutorDetails(let id):
            return "Tutor/\(id)"
        case .session:
            return "Session"
        case .studentSession(let studentId):
            return "Session/\(studentId)/student"
        case .tutorSession(let tutorId):
            return "Session/\(tutorId)/tutor"
        case .documentUpload:
            return "document/upload"
        case .imageUpload:
            return "image/upload"
        case .carMakes:
            return "inventory/make"
        case .carModels:
            return "inventory/model"
        case .auctionDetails(let id):
            return "auction/\(id)"
        case .user(let id):
            return "User/\(id)"
        case .myLocation:
            return "\(Bundle.main.baseURL.replacingOccurrences(of: "v1/", with: ""))get-my-location"
        case .colors:
            return "inventory/marketplace/colors"
        case .states:
            return "state"
        case .cities:
            return "city"
        case .bodyTypes:
            return "inventory/body_type"
        case .franchise:
            return "franchise"
        case .inspectionRequest:
            return "inventory/inspection_request"
        case .inventoryCarOffer:
            return "inventory/car-offer"
        case .sourcingOverview:
            return "inventory/car-request/sourcing-overview"
        case .inspectionRequestStatus:
            return "inventory/inspection_request/status"
        case .inspectionRequestDetails(let id):
            return "inventory/inspection_request/\(id)"
        }
    }
    
    var requestURL: String { "\(Bundle.main.baseURL)\(desc)" }
}
