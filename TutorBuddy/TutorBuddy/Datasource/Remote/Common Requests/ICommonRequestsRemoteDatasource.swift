//
//  ICommonRequestsRemoteDatasource.swift
//  TutorBuddy
//

import Foundation
import RxSwift
import Alamofire

protocol ICommonRequestsRemoteDatasource {
    
    func refreshToken(params: Parameters) -> Observable<TBRefreshTokenResponse>
}
