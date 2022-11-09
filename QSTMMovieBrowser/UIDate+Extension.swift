//
//  UIDate+Extension.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation
import UIKit

extension Date {
    func dateToString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
