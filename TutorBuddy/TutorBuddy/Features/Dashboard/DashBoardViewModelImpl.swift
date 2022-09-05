//
//  DashBoardViewModelImp.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import Foundation
import RxSwift
import Alamofire

class DashBoardViewModelImpl: BaseViewModel, IDashBoardViewModel {
    
    var preference: IPreference
    var userName = BehaviorSubject(value: "")
    var userUpdated = PublishSubject<Bool>()
    fileprivate let dashboardRemote: IDashboardRemoteDatasource
    fileprivate let authRemote: IAuthRemoteDatasource
    
    
    init(preference:IPreference, dashboardRemote: IDashboardRemoteDatasource, authRemote: IAuthRemoteDatasource) {
        self.preference =  preference
        self.dashboardRemote = dashboardRemote
        self.authRemote = authRemote
    }
    
    func getUserDetails() {
        subscribe(dashboardRemote.getUserDetails(id: preference.userID), success: { [weak self] res in
            if res.success == true && res.data.isNotNil {
                self?.preference.user = res.data
                self?.userName.onNext((res.data?.firstName ?? "John") + " " + (res.data?.lastName ?? "Doe"))
            }
        })
    }
    
    func updateUser(with fullName: String, and email: String) {
        var components = fullName.components(separatedBy: " ")
        if components.count > 0 {
            let firstName = components.removeFirst()
            let lastName = components.joined(separator: " ")
            let params: Parameters = [
                "firstName": firstName,
                "lastName": lastName,
                "email": email
            ]
            subscribe(authRemote.updateUser(params: params), success: { [weak self] res in
                if res.success == true && res.data?.isEmpty == false {
                    self?.userUpdated.onNext(true)
                    self?.showMessage("User updated successfully.", type: .success)
                }
            }, error: { [weak self] error in
                self?.showMessage(error.localizedDescription, type: .error)
            })
        }
    }
}
