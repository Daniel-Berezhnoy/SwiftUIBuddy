//
//  StandardButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct StandardButton: View {
    
    let title: String
    let color: Color
    let font: Font
    let height: CGFloat
    let action: () -> Void
    
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
            .frame(height: height, alignment: .center)
            .cornerRadius(10)
            .foregroundColor(color)
    }
    
    var text: some View {
        Text(title)
            .font(font)
            .foregroundColor(.white)
            .padding(.horizontal)
            .lineLimit(1)
    }
    
    /// Standard-Looking generic button. Just pass in title, color and action.
    /// You can also pass in custom Font and Height for more customization.
    public init(title: String, color: Color,
                font: Font = .system(size: 18, weight: .semibold, design: .rounded),
                height: CGFloat = 55,
                action: @escaping () -> Void) {
        
        self.title = title
        self.color = color
        self.font = font
        self.height = height
        self.action = action
    }
}

@available(iOS 15.0, *)
struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            StandardButton(title: "Just a Button", color: .blue) {}
            StandardButton(title: "Thin Button", color: .red.opacity(0.9), height: 40) {}
            StandardButton(title: "Custom Font", color: .black, font: .title2.weight(.black)) {}
        }
        .padding(.horizontal, 25)
    }
}
