//
//  OnboardingViewModelImpl.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/12/2021.
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
        if preference.user.isNotNil {
            authNavRoute.onNext(.dashboard)
        } else if preference.hasOnboarded {
            authNavRoute.onNext(.signin)
        }
    }
    
}
