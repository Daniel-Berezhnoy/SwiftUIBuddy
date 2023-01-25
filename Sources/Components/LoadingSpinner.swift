//
//  LoadingSpinner.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct LoadingSpinner: View {
    
    let color: Color
    
    public var body: some View {
        ZStack {
            rectangle
            spinner
        }
        .frame(width: 85, height: 85)
    }
    
    var rectangle: some View {
        Rectangle()
            .foregroundStyle(color)
            .cornerRadius(20)
            .opacity(0.15)
    }
    
    var spinner: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .controlSize(.large)
            .tint(color)
    }
    
    /// A loading spinner. Change the tint color for customization.
    public init(tint: Color = .secondary) { self.color = tint }
}

@available(iOS 15.0, *)
struct LoadingSpinner_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSpinner()
        LoadingSpinner(tint: .blue)
    }
}
