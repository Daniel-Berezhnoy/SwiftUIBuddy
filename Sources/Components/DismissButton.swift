//
//  DismissButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/8/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DismissButton: View {
    public var body: some View {
        Text("Hello, World! 🤙")
    }
    
    /// This button is great for dismissing things like Sheets, Popovers or Cards!
    /// Just specify the size and put your dismiss action inside the closure
    public init() {}
}

@available(iOS 15.0, *)
struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
