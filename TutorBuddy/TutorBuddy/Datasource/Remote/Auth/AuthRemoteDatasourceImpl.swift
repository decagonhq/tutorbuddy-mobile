//
//  AuthRemoteDatasourceImpl.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 05/01/2022.
//

import Foundation
import RxSwift
import Alamofire

class AuthRemoteDatasourceImpl: BaseRemoteDatasource, IAuthRemoteDatasource {
    
    func signin(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .login, responseType: AnyStruct.self, method: .post, params: params)
    }
    
    func requestOTP(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .requestOTP, responseType: AnyStruct.self, method: .post, params: params)
    }
    
    func verifyOTP(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .verifyOTP, responseType: AnyStruct.self, method: .post, params: params)
    }
    
    func updatePassword(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .updatePassword, responseType: AnyStruct.self, method: .post, params: params)
    }
    
}
