//
//  RegisterCell.swift
//  VideoApp
//
//  Created by Hooma7n on 12/1/20.
//

import Foundation
import UIKit

extension UITableView {
    func registerCell(_ name : String) {
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}


extension UIViewController {
    func performingSegue(_ name : String){
        self.performSegue(withIdentifier: name, sender: self)
    }
}
