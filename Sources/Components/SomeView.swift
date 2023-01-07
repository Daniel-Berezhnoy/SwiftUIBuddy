//
//  SomeView.swift
//  
//
//  Created by Daniel Berezhnoy on 1/7/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SomeView: View {
    public var body: some View {
        Text("Hello, World!")
    }
    
    public init() {}
}

@available(iOS 15.0, *)
struct SomeView_Previews: PreviewProvider {
    static var previews: some View {
        SomeView()
    }
}
