//
//  File.swift
//  
//
//  Created by Daniel Berezhnoy on 1/25/23.
//

import SwiftUI

@available(iOS 15.0, *)
extension Double {
    func getPercentage(_ percent: Double, of initialValue: Double) -> Double {
        initialValue * percent / 100.0
    }
}

extension CGFloat {
    func getPercentage(_ percent: Double) -> Double {
        self * percent / 100.0
    }
}
