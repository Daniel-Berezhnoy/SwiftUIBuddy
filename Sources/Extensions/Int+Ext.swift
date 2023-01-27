//
//  Int+Ext.swift
//  
//
//  Created by Daniel Berezhnoy on 1/27/23.
//

import Foundation

extension Int {
    func onlyPositive() -> Int { self < 0 ? 0 : self }
}
