//
//  setLabelExt.swift
//  VideoApp
//
//  Created by Hooma7n on 12/2/20.
//

import Foundation
import UIKit

extension UILabel {
    func setText(_ text : String?) {
        self.text = text.unwrapStr()
    }
}
