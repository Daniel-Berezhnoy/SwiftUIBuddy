//
//  CGFloat+Ext.swift
//  
//
//  Created by Daniel Berezhnoy on 1/25/23.
//

import SwiftUI

@available(iOS 15.0, *)
extension CGFloat {
    func getPercentage(_ percent: CGFloat) -> CGFloat {
        self * percent / 100.0
    }
}
