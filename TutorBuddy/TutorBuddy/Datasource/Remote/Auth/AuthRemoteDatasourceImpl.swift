//
//  AuthRemoteDatasourceImpl.swift
//  TutorBuddy
//

import Foundation
import RxSwift
import Alamofire

class AuthRemoteDatasourceImpl: BaseRemoteDatasource, IAuthRemoteDatasource {
    
    func signin(params: Parameters) -> Observable<TBBaseResponse> {
        makeAPIRequest(path: .login, responseType: TBBaseResponse.self, method: .post, params: params)
    }
    
    func signup(params: Parameters) -> Observable<TBRegisterResponse> {
        makeAPIRequest(path: .register, responseType: TBRegisterResponse.self, method: .post, params: params)
    }
    
    func requestOTP(params: Parameters) -> Observable<TBRegisterResponse> {
        makeAPIRequest(path: .requestOTP, responseType: TBRegisterResponse.self, method: .post, params: params)
    }
    
    func verifyOTP(params: Parameters) -> Observable<TBRegisterResponse> {
        makeAPIRequest(path: .verifyOTP, responseType: TBRegisterResponse.self, method: .post, params: params)
    }
    
    func resetPassword(params: Parameters) -> Observable<TBRegisterResponse> {
        makeAPIRequest(path: .resetPassword, responseType: TBRegisterResponse.self, method: .patch, params: params)
    }
    
    func getRegisterResource() -> Observable<TBRegisterResourceResponse> {
        makeAPIRequest(path: .register, responseType: TBRegisterResourceResponse.self, encoding: URLEncoding.default)
    }
    
    func updateUser(params: Parameters) -> Observable<TBRegisterResponse> {
        makeAPIRequest(path: .updateUser, responseType: TBRegisterResponse.self, method: .put, params: params, headers: [.authorization(bearerToken: preference.accessToken)])
    }
    
}
