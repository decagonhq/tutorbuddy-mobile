//
//  AnyStruct.swift
//  TutorBuddy
//

import Foundation
import UIKit

struct AnyStruct: Codable {}

struct FeaturedTutor: Codable, Scopable {
    let id, avatar, fullName: String?
    let rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, avatar, rating = "rate", fullName = "fullname"
    }
}

struct Course: Scopable {
    let avatarImage: UIImage?
    let courseName: String?
    let courseRating: String?
}

struct CourseRequest: Scopable {
    let avatarImage: UIImage?
    let courseName: String?
    let studentName: String?
    let courseDuration: String?
    let progressStatus: ProgressStatus?
}

enum ProgressStatus: Int, CaseIterable {
    case inProgress, completed, cancelled
}

struct Rating: Scopable {
    let ratingTitle: String?
    let ratingSubtitle: String?
}

struct AccountItem: Scopable {
    let title: String
    let icon: UIImage?
    var shouldHaveSwitch: Bool = false
    
    static let items = [
        AccountItem(title: "Edit Profile", icon: R.image.profile_icon(), shouldHaveSwitch: false),
        AccountItem(title: "Notification", icon: R.image.notification_icon(), shouldHaveSwitch: true),
        AccountItem(title: "Change Password", icon: R.image.lock_icon(), shouldHaveSwitch: false),
        AccountItem(title: "Logout", icon: R.image.logout_icon(), shouldHaveSwitch: false)
    ]
}
