//
//  CommonDependencyContainer.swift
//  TutorBuddy
//

import Foundation
import Swinject

struct CommonDependencyContainer {
    
    static func configure(using container: Container) {
        container.register(IPreference.self) { _ in PreferenceImpl() }

        container.register(ICommonRequestsRemoteDatasource.self) { _ in CommonRequestsRemoteDatasourceImpl() }
    }
    
}
