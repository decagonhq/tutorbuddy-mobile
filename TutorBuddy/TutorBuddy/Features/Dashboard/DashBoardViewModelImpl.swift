//
//  DashBoardViewModelImp.swift
//  TutorBuddy
//
//  Created by  Ugo  Val on 20/07/2022.
//

import Foundation

class DashBoardViewModelImpl: BaseViewModel, IDashBoardViewModel {
    
    
    fileprivate let preference: IPreference
    
    init(preference:IPreference) {
        self.preference =  preference
    }
}
