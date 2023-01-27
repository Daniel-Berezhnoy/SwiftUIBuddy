//
//  Font+Ext.swift
//  
//
//  Created by Daniel Berezhnoy on 1/26/23.
//

import SwiftUI

@available(iOS 15.0, *)
extension Font {
    public var buttonStyle: Font {
        Font.system(size: 18, weight: .semibold, design: .rounded)
    }
}
