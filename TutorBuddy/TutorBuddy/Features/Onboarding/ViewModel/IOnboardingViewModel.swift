//
//  IOnboardingViewModel.swift
//  TutorBuddy
//

import Foundation
import RxSwift

protocol IOnboardingViewModel {
    var authNavRoute: PublishSubject<AuthNavRoute> { get }
}
