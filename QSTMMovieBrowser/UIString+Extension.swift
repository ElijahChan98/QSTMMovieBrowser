//
//  UIString+Extension.swift
//  QSTMMovieBrowser
//
//  Created by Elijah Chan on 11/9/22.
//

import Foundation
import UIKit

extension String {
    func stringToDate(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self) ?? Date()
    }
}
