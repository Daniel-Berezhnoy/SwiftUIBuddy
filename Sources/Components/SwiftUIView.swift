//
//  SwiftUIView.swift
//  
//
//  Created by Daniel Berezhnoy on 1/17/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SwiftUIView: View {
    
    @State private var progress = 0.0
    
    public var body: some View {
        VStack(spacing: 40) {
            ProgressView(value: progress, total: 100)
            
            StandardButton(title: "Add Progress", color: .blue) {
                withAnimation(.spring()) { progress += 5 }
            }
        }
        .padding(30)
    }
}

@available(iOS 15.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
