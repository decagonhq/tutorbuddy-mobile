//
//  RemotePath.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation

enum RemotePath {
    
    case login, requestOTP, verifyOTP, updatePassword
    case documentUpload, imageUpload
    case carMakes, carModels, auctionDetails(String)
    case user, myLocation, colors, states, cities, bodyTypes, franchise
    case inspectionRequest, inventoryCarOffer, sourcingOverview, inspectionRequestStatus, inspectionRequestDetails(String)
    
    var desc: String {
        switch self {
        case .login:
            return "auth/login"
        case .requestOTP:
            return "auth/login/otp"
        case .verifyOTP:
            return "auth/login/otp/verify"
        case .updatePassword:
            return "auth/update-password"
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
        case .user:
            return "user"
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
