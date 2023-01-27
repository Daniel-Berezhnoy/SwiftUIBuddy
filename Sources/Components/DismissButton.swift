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
        .accessibilityLabel("Dismiss Button")
    }
    
    var image: some View {
        Image(systemName: "xmark.circle.fill")
            .foregroundColor(color)
            .font(.system(size: size))
    }
    
    /// This button is great for dismissing things like Sheets, Popovers or Cards.
    /// To initialize, just put your dismiss action inside the closure.
    /// You can also specify the Size and Color of the button.
    public init(size: Double = 27,
                color: Color = .gray.opacity(0.75),
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
