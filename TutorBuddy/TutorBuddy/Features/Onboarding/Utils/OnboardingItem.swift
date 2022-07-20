//
//  OboardingItem.swift
//  TutorBuddy
//

import UIKit

enum OnboardingItem: String, CaseIterable, Scopable {
    case one = "Discover your next skill and learn anything you want easily!"
    
    var subtitle: String {
        switch self {
        case .one:
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nisl pharetra arcu a morbi in in nibh suspendiss congue."
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .one:
            return R.image.onboarding_item_1()
        }
    }
}
