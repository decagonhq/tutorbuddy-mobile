//
//  ValidationType.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 01/01/2022.
//

import Foundation

enum ValidationType {
    case email, emailOrPhone, phoneNumber, password, confirmPassword, name, amount, numeric, address, mileage(Double), vin(Int)
}
