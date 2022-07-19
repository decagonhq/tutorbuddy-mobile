//
//  CommonRequestsRemoteDatasourceImpl.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 30/03/2022.
//

import Foundation
import RxSwift
import Alamofire

final class CommonRequestsRemoteDatasourceImpl: BaseRemoteDatasource, ICommonRequestsRemoteDatasource {
    
    func getMyLocation() -> Observable<AnyStruct> {
        makeAPIRequest(path: RemotePath.myLocation.desc, responseType: AnyStruct.self)
    }
    
    func getUsers(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .user, responseType: AnyStruct.self, params: params, encoding: URLEncoding.default)
    }
    
    func getStates(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .states, responseType: AnyStruct.self, params: params, encoding: URLEncoding.default)
    }
    
    func getCities(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .cities, responseType: AnyStruct.self, params: params, encoding: URLEncoding.default)
    }
    
    func saveUser(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .user, responseType: AnyStruct.self, method: .post, params: params)
    }
    
    func getBodyTypes(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .bodyTypes, responseType: AnyStruct.self, params: params, encoding: URLEncoding.default)
    }
    
    func getColors() -> Observable<AnyStruct> {
        makeAPIRequest(path: .colors, responseType: AnyStruct.self)
    }
    
    func getFranchises(params: Parameters) -> Observable<AnyStruct> {
        makeAPIRequest(path: .franchise, responseType: AnyStruct.self, params: params, encoding: URLEncoding.default)
    }
    
    func uploadFile(url: URL, type: FileUploadType) -> Observable<DocumentUploadResponse> {
        makeFileUploadRequest(fileURL: url, type: type)
    }
    
}
