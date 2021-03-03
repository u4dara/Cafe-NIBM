//
//  buttonStyle.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-03-01.
//

import Foundation
import UIKit


class roundButton: UIButton {
    override func didMoveToWindow() {
        self.layer.cornerRadius = 25
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
