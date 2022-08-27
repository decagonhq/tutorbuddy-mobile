//
//  OboardingItem.swift
//  TutorBuddy
//

import UIKit

enum OnboardingItem: String, CaseIterable, Scopable {
    case one = "Quality Education just for you"
    case two = "Find your best tutor to reach your goals"
    case three = "Digitalized process & quality education"
    
    var subtitle: String {
        switch self {
        case .one:
            return "Our tutors are certified active or retired teachers. With a strong passion for teaching."
        case .two:
            return "With our qualified tutors search for the perfect teacher to give you the best practices."
        case .three:
            return "Everything is digitalized to your taste, seamsless process with quality tutors."
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .one:
            return R.image.onboarding_item_1()
        case .two:
            return R.image.onboarding_item_2()
            
        case .three:
            return R.image.onboarding_item_3()
        }
    }
}
