//
//  Dividers.swift
//  
//
//  Created by Daniel Berezhnoy on 3/4/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct Dividers: View {
    
    let numberOfDividers: Int
    
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< numberOfDividers, id: \.self) { divider in
                Divider()
            }
        }
    }
    
    /// A VStack of Dividers. Just specify the amount of Dividers. Increasing the number will increase the thickness.
    public init(_ numberOfDividers: Int) {
        self.numberOfDividers = numberOfDividers
    }
}

@available(iOS 15.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Divider()
            
            Text("Divider()")
                .padding(.bottom, 40)
            
            Dividers(6)
            
            Text("Dividers(6)")
        }
    }
}
