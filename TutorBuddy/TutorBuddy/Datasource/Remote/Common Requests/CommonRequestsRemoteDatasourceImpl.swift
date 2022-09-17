//
//  CommonRequestsRemoteDatasourceImpl.swift
//  TutorBuddy
//

import Foundation
import RxSwift
import Alamofire

final class CommonRequestsRemoteDatasourceImpl: BaseRemoteDatasource, ICommonRequestsRemoteDatasource {
    
    func refreshToken(params: Parameters) -> Observable<TBRefreshTokenResponse> {
        makeAPIRequest(path: .refreshToken, responseType: TBRefreshTokenResponse.self, method: .post, params: params, headers: nil)
    }
    
}
