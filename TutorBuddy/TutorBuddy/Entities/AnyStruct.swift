//
//  AnyStruct.swift
//  TutorBuddy
//

import Foundation
import UIKit

struct AnyStruct: Codable {}

struct FeaturedTutor: Scopable {
    let avatarImage: UIImage?
    let tutorName: String?
    let rating: String?
}

struct Course: Scopable {
    let avatarImage: UIImage?
    let courseName: String?
    let courseRating: String?
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
