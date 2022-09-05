//
//  DashBoardViewModel.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import Foundation
import RxSwift

protocol IDashBoardViewModel {
    
    var userName: BehaviorSubject<String> { get }
    
    var userUpdated: PublishSubject<Bool> { get }
    
    func getUserDetails()
    
    func updateUser(with fullName: String, and email: String)
}
