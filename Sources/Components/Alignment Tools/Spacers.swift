//
//  Spacers.swift
//  
//
//  Created by Daniel Berezhnoy on 1/7/23.
//

import SwiftUI

#warning("Add the README, GitHub Description and all that good stuff")

@available(iOS 15.0, *)
public struct Spacers: View {
    
    let numberOfSpacers: UInt
    
    public var body: some View {
        ForEach(0 ..< numberOfSpacers, id: \.self) { spacer in
            Spacer()
        }
    }
    
    /// A stack of Multiple Spacers. Just specify the amount of Spacers you want. Great for creating custom View Layouts.
    public init(_ numberOfSpacers: UInt) {
        self.numberOfSpacers = numberOfSpacers
    }
}

@available(iOS 15.0, *)
struct Spacers_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Text("I'm just a text")
            Spacers(2)
        }
    }
}
