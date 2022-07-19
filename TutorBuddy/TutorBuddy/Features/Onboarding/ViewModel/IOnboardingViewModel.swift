//
//  IOnboardingViewModel.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
//

import Foundation
import RxSwift

protocol IOnboardingViewModel {
    var authNavRoute: PublishSubject<AuthNavRoute> { get }
}
