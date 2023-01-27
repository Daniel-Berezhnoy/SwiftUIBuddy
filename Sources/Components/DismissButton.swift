//
//  DismissButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/8/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DismissButton: View {
    
    let size: Double
    let color: Color
    let action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            image
        }
    }
    
    var image: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(color)
            .font(.system(size: size))
    }
    
    /// This button is great for dismissing things like Sheets, Popovers or Cards!
    /// Just put your dismiss action inside the closure.
    /// You can also specify the size and pass in the custom color.
    public init(size: Double = 25,
                color: Color = .gray.opacity(0.8),
                action: @escaping () -> Void) {
        
        self.size = size
        self.color = color
        self.action = action
    }
}

@available(iOS 15.0, *)
struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton(size: 100) {}
        DismissButton(color: .purple) {}
    }
}
