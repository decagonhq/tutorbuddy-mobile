//
//  IAuthRemoteDatasource.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 05/01/2022.
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
