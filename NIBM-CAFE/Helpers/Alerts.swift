//
//  Styles.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-03-01.
//

import Foundation
import UIKit

class Service {
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        return alert
    }
}
