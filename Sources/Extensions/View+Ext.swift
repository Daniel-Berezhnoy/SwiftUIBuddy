//
//  View+Ext.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

@available(iOS 15.0, *)
extension View {
    public func blurFilter() -> some View {
        ZStack {
            self
            BlurFilter()
        }
    }
}
