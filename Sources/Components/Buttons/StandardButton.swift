//
//  StandardButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct StandardButton: View {
    
    let font: Font
    let color: Color
    let title: String
    let height: CGFloat
    let action: () -> Void
    let cornerRadius: CGFloat
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                background
                text
            }
        }
    }
    
    var background: some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(color)
            .cornerRadius(cornerRadius)
    }
    
    var text: some View {
        Text(title)
            .font(font)
            .lineLimit(1)
            .foregroundColor(.white)
            .padding(.horizontal)
    }
    
    /// A Simple Button that can be used anywhere throughout the app.
    /// You initialize it just like the standard SwiftUI Button, by passing in the title and action.
    /// For more customization, pass in Custom Color, Corner Radius, Font and Height.
    public init(_ title: String,
                color: Color = .blue,
                cornerRadius: CGFloat = 10,
                font: Font = .buttonStyle,
                height: CGFloat = 55,
                action: @escaping () -> Void) {
        
        self.font = font
        self.title = title
        self.color = color
        self.height = height
        self.action = action
        self.cornerRadius = cornerRadius
    }
}

@available(iOS 15.0, *)
struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            StandardButton("Thin Button", color: .orange, cornerRadius: 40, height: 40) {}
            StandardButton("Default Button") {}
            StandardButton("Custom Font", color: .purple, font: .title2.weight(.black)) {}
        }
        .padding(.horizontal, 25)
    }
}
