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
    
    public var body: some View {
        ZStack {
            Rectangle()
                .frame(height: height, alignment: .center)
                .cornerRadius(10)
                .foregroundColor(color)
            
            Text(title)
                .font(font)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 25)
    }
    
    /// Standard-Looking generic button. Just pass in a title and a color.
    /// You can also pass in custom Font and Height for more customization.
    public init(title: String, color: Color,
                font: Font = Font.system(size: 18, weight: .semibold, design: .rounded),
                height: CGFloat = 55) {
        self.title = title
        self.color = color
        self.font = font
        self.height = height
    }
}

@available(iOS 15.0, *)
struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        StandardButton(title: "Just a Button", color: .cyan)
        StandardButton(title: "Thin Button", color: .red.opacity(0.9), height: 40)
        StandardButton(title: "Custom Font", color: .black, font: .title2.weight(.black))
    }
}
