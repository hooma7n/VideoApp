//
//  Exts.swift
//  VideoApp
//
//  Created by Hooma7n on 12/2/20.
//

import Foundation
import UIKit

extension Optional where Wrapped == String {
    func unwrapStr() -> String {
        if let str = self {
            return str
        } else {
            return ""
        }
    }
}
