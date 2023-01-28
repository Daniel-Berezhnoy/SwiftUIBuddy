//
//  BlurEffect.swift
//  
//
//  Created by Daniel Berezhnoy on 1/27/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct BlurEffect: View {
    
    public var body: some View {
        Rectangle()
            .frame(width: 200, height: 300)
            .foregroundStyle(.blue)
            .cornerRadius(20)
    }
    
    public init() {}
}

@available(iOS 15.0, *)
struct BlurEffect_Previews: PreviewProvider {
    static var previews: some View {
        BlurEffect()
    }
}
