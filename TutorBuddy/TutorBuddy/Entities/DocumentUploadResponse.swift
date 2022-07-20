//
//  DocumentUploadResponse.swift
//  TutorBuddy
//

import Foundation

struct DocumentUploadResponse: Codable {
    let file: FileUploadResponse?
}

struct FileUploadResponse: Codable {
    let originalName, tempFilePath, mimetype: String?
    let isPublic: Bool?
    let name, url: String?

    enum CodingKeys: String, CodingKey {
        case originalName, tempFilePath, mimetype
        case isPublic = "public"
        case name, url
    }
}

enum FileUploadType {
    case image, document
    
    var path: RemotePath {
        switch self {
        case .image:
            return .imageUpload
        case .document:
            return .documentUpload
        }
    }
}
