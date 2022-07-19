//
//  ICommonRequestsRemoteDatasource.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/03/2022.
//

import Foundation
import RxSwift
import Alamofire

protocol ICommonRequestsRemoteDatasource {
    func getMyLocation() -> Observable<AnyStruct>
    
    func getUsers(params: Parameters) -> Observable<AnyStruct>
    
    func getStates(params: Parameters) -> Observable<AnyStruct>
    
    func getCities(params: Parameters) -> Observable<AnyStruct>
    
    func saveUser(params: Parameters) -> Observable<AnyStruct>
    
    func getBodyTypes(params: Parameters) -> Observable<AnyStruct>
    
    func getColors() -> Observable<AnyStruct>
    
    func getFranchises(params: Parameters) -> Observable<AnyStruct>
    
    func uploadFile(url: URL, type: FileUploadType) -> Observable<DocumentUploadResponse>
    
}
