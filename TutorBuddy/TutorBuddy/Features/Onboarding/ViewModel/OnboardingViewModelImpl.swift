//
//  OnboardingViewModelImpl.swift
//  TutorBuddy
//

import Foundation
import RxSwift

class OnboardingViewModelImpl: BaseViewModel, IOnboardingViewModel {
    
    var authNavRoute = PublishSubject<AuthNavRoute>()
    var preference: IPreference
    let commonRemote: ICommonRequestsRemoteDatasource
    
    init(preference: IPreference, commonRemote: ICommonRequestsRemoteDatasource) {
        self.preference = preference
        self.commonRemote = commonRemote
    }
    
    override func didAppear() {
        super.didAppear()
//        getUserCountry()
        navigate()
    }
    
    fileprivate func getUserCountry() {
//        if preference.country?.id.isNil ?? true {
//            subscribe(commonRemote.getMyLocation(), showMessageAlerts: false, success: { [weak self] country in
//                self?.preference.country = country
//                self?.navigate()
//            }, error: { [weak self] _ in
//                self?.navigate()
//            })
//        } else {
//            navigate()
//        }
    }
    
    fileprivate func navigate() {
        if preference.accessToken.isNotEmpty {
            if preference.roles.contains(where: { $0.insensitiveEquals("Student") }) {
                authNavRoute.onNext(.studentDashboard)
            } else if preference.roles.contains(where: { $0.insensitiveEquals("Tutor") }) {
                authNavRoute.onNext(.tutorDashboard)
            }
        } else if preference.hasOnboarded {
            authNavRoute.onNext(.signin)
        }
    }
    
}
