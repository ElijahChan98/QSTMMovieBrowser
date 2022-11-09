//
//  UIView+Extension.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
    }
}
