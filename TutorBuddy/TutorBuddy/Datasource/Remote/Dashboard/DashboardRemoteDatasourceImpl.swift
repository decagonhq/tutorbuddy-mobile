//
//  DashboardRemoteDatasourceImpl.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 04/09/2022.
//

import Foundation
import RxSwift
import Alamofire

class DashboardRemoteDatasourceImpl: BaseRemoteDatasource, IDashboardRemoteDatasource {
    
    func getUserDetails(id: String) -> Observable<TBUserResponse> {
        makeAPIRequest(path: .user(id), responseType: TBUserResponse.self, headers: [.authorization(bearerToken: preference.accessToken)])
    }
}


