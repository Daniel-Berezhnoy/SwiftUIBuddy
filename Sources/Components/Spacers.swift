//
//  Spacers.swift
//  
//
//  Created by Daniel Berezhnoy on 1/7/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct Spacers: View {
    var numberOfSpacers: Int
    
    public var body: some View {
        
        #warning("Don't let the user pass in the negative amount of Spacers")
        ForEach(0 ..< numberOfSpacers, id: \.self) { _ in
            Spacer()
        }
    }
    
    /// A stack of Spacers.
    /// Just specify the amount of Spacers you want.
    public init(_ numberOfSpacers: Int) {
        self.numberOfSpacers = numberOfSpacers
    }
}

@available(iOS 15.0, *)
struct MultiSpacer_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Text("I'm just a text")
            Spacers(2)
        }
    }
}
