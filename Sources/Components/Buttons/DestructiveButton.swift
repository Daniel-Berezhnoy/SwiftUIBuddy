//
//  DestructiveButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DestructiveButton: View {
    
    let font: Font
    let title: String
    let height: Double
    let action: () -> Void
    let cornerRadius: CGFloat
    let buttonStyle: DestructiveButtonStyle
    
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
            .foregroundColor(buttonStyle == .prominent ? .red : .background)
            .cornerRadius(cornerRadius)
            .overlay(redBorder)
    }
    
    var redBorder: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(lineWidth: 2)
            .foregroundColor(.red)
    }
    
    var text: some View {
        Text(title)
            .font(font)
            .lineLimit(1)
            .foregroundColor(buttonStyle == .prominent ? .white : .red)
            .padding(.horizontal)
    }
    
    public enum DestructiveButtonStyle {
        case prominent, bordered
    }
    
    /// Destructive Button is great for destructive actions like deletion, cancelation, etc.
    /// To use, just pass in title and put your cancellation action inside the closure.
    /// You can also specify the Button Style, Corner Radius, Custom Font and Height for more customization.
    public init(_ title: String,
                style: DestructiveButtonStyle = .prominent,
                cornerRadius: CGFloat = 10,
                font: Font = .buttonStyle,
                height: Double = 55,
                action: @escaping () -> Void) {
        
        self.font = font
        self.title = title
        self.height = height
        self.action = action
        self.buttonStyle = style
        self.cornerRadius = cornerRadius
    }
}

@available(iOS 15.0, *)
struct DestructiveButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            DestructiveButton("Delete Account", style: .bordered) {}
            DestructiveButton("Remove Connection") {}
        }
        .padding(.horizontal, 25)
    }
}
