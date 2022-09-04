//
//  IAuthRemoteDatasource.swift
//  TutorBuddy
//

import Foundation
import RxSwift
import Alamofire

protocol IAuthRemoteDatasource {
    func signin(params: Parameters) -> Observable<TBBaseResponse>
    
    func signup(params: Parameters) -> Observable<TBRegisterResponse>
    
    func requestOTP(params: Parameters) -> Observable<TBRegisterResponse>
    
    func verifyOTP(params: Parameters) -> Observable<TBRegisterResponse>
    
    func resetPassword(params: Parameters) -> Observable<TBRegisterResponse>
    
    func getRegisterResource() -> Observable<TBRegisterResourceResponse>
}
