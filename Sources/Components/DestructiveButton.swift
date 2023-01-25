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
    var buttonStyle: DestructiveButtonStyle
    
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
            .foregroundColor(buttonStyle == .plain ? .red : .background)
            .cornerRadius(10)
            .overlay(redBorder)
    }
    
    var redBorder: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .foregroundColor(.red)
    }
    
    var text: some View {
        Text(title)
            .font(font)
            .lineLimit(1)
            .foregroundColor(buttonStyle == .plain ? .white : .red)
            .padding(.horizontal)
    }
    
    public enum DestructiveButtonStyle {
        case plain, bordered
    }
    
    /// Destructive Button is great for destructive actions like deletion, cancelation, etc.
    /// To use, just pass in title and put your cancellation action inside the closure.
    /// You can also pass in custom Font, Height and ButtonStyle for more customization.
    public init(title: String,
                style: DestructiveButtonStyle = .plain,
                font: Font = .system(size: 18, weight: .semibold, design: .rounded),
                height: Double = 55,
                action: @escaping () -> Void) {
        
        self.title = title
        self.buttonStyle = style
        self.font = font
        self.height = height
        self.action = action
    }
}

@available(iOS 15.0, *)
struct DestructiveButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            DestructiveButton(title: "Delete Account", style: .bordered) {}
            DestructiveButton(title: "Remove Connection") {}
        }
        .padding(.horizontal, 25)
    }
}
