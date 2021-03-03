//
//  PasswordValidation.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-02-25.
//

import Foundation
import UIKit

class validation{
    static func isPasswordValid( password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
