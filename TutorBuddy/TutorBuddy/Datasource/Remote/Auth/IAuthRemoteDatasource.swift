//
//  IAuthRemoteDatasource.swift
//  TutorBuddy
//

import Foundation
import RxSwift
import Alamofire

protocol IAuthRemoteDatasource {
    func signin(params: Parameters) -> Observable<AnyStruct>
    
    func requestOTP(params: Parameters) -> Observable<AnyStruct>
    
    func verifyOTP(params: Parameters) -> Observable<AnyStruct>
    
    func updatePassword(params: Parameters) -> Observable<AnyStruct>
}
