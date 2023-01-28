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
        ZStack {
            Rectangle()
                .frame(width: 200, height: 300)
                .foregroundStyle(.blue)
                .cornerRadius(20)
            
            Text("Do you see me?")
                .foregroundStyle(.white)
        }
        .blur(radius: 10)
    }
    
    public init() {}
}

@available(iOS 15.0, *)
struct BlurEffect_Previews: PreviewProvider {
    static var previews: some View {
        BlurEffect()
    }
}
