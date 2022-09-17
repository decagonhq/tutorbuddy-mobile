//
//  Constants.swift
//  TutorBuddy
//

import Foundation
import UIKit

struct Constants {
    static let DATA_NOT_FOUND = "No Data Found!"
    
    static let PHONE_CODES = ["+234", "+233", "+254"]
    
    static func MAX_PHONE_NUMBER_LENGTH(code: String = "+234") -> Int {
        switch code {
        case "+234", "NG":
            return 10
        case "+233", "GH", "+254", "KE":
            return 9
        default:
            return 10
        }
    }
    
    static func COUNTRY_FLAG(code: String = "+234") -> UIImage? {
        switch code {
        case "+234", "NG":
            return UIImage(named: "nig_icon")
        case "+233", "KE":
            return UIImage(named: "ke_ios")
        case "+254", "GH":
            return UIImage(named: "gh_ios")
        default:
            return UIImage(named: "nig_icon")
        }
    }
    
    static let YEARS = Array(2000...currentYear().int!).reversed().map { $0.string }
    
    static let COURSES = [
        Course(avatarImage: R.image.physics_banner(), courseName: "The complete tutorial on physics", courseRating: "4.7"),
        Course(avatarImage: R.image.chemistry_banner(), courseName: "Chemistry for beginners: 30 days perfection", courseRating: "4.8"),
        Course(avatarImage: R.image.maths_banner(), courseName: "Everything about mathematics & algebra", courseRating: "4.3"),
        Course(avatarImage: R.image.python_banner(), courseName: "Learning Python for Data analysis", courseRating: "5.0"),
        Course(avatarImage: R.image.chemistry_banner(), courseName: "Chemistry for beginners: 30 days perfection", courseRating: "4.8"),
        Course(avatarImage: R.image.maths_banner(), courseName: "Everything about mathematics & algebra", courseRating: "4.3"),
        Course(avatarImage: R.image.python_banner(), courseName: "Learning Python for Data analysis", courseRating: "5.0"),
        Course(avatarImage: R.image.physics_banner(), courseName: "The complete tutorial on physics", courseRating: "4.7")
    ]
    
//    static let TUTORS = [
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "4.7"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "4.8"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "4.3"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "5.0"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "4.8"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "4.3"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "5.0"),
//        FeaturedTutor(avatarImage: R.image.avatar_icon(), tutorName: "Chukwudi Kamdibe", rating: "4.7")
        
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//        FeaturedTutor(id: "", avatar: "", fullName: "", rating: 0),
//    ]
    
    static let COURSE_REQUESTS = [
        CourseRequest(avatarImage: R.image.python_banner(), courseName: "Learning Python for Data analysis", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .inProgress),
        CourseRequest(avatarImage: R.image.physics_banner(), courseName: "The complete tutorial on physics", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .inProgress),
        CourseRequest(avatarImage: R.image.chemistry_banner(), courseName: "Chemistry for beginners: 30 days perfection", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .completed),
        CourseRequest(avatarImage: R.image.maths_banner(), courseName: "Everything about mathematics & algebra", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .completed),
        CourseRequest(avatarImage: R.image.physics_banner(), courseName: "The complete tutorial on physics", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .inProgress),
        CourseRequest(avatarImage: R.image.python_banner(), courseName: "Learning Python for Data analysis", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .completed),
        CourseRequest(avatarImage: R.image.chemistry_banner(), courseName: "Chemistry for beginners: 30 days perfection", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .completed),
        CourseRequest(avatarImage: R.image.maths_banner(), courseName: "Everything about mathematics & algebra", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .inProgress),
        CourseRequest(avatarImage: R.image.python_banner(), courseName: "Learning Python for Data analysis", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .inProgress),
        CourseRequest(avatarImage: R.image.python_banner(), courseName: "Learning Python for Data analysis", studentName: "Chukwudi Kamdibe", courseDuration: "July 26 - 30, 2022", progressStatus: .completed),
    ]
}
