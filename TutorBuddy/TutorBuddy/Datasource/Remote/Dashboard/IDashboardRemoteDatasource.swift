//
//  IDashboardRemoteDatasource.swift
//  TutorBuddy
//
//  Created by Folahanmi Kolawole on 04/09/2022.
//

import Foundation
import RxSwift
import Alamofire

protocol IDashboardRemoteDatasource {
    
    func getUserDetails(id: String) -> Observable<TBUserResponse>
}
