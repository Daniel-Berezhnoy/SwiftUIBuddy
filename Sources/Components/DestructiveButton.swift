//
//  DestructiveButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DestructiveButton: View {
    
    let title: String
    let font: Font
    let height: Double
    let action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                border
                text
            }
        }
        .padding(.horizontal, 25)
    }
    
    var border: some View {
        Rectangle()
            .frame(height: height)
            .foregroundColor(.background)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(.red))
    }
    
    var text: some View {
        Text(title)
            .font(.system(size: 18, weight: .semibold, design: .rounded))
            .fontWeight(.semibold)
            .foregroundColor(.red)
    }
    
    public init(title: String,
                font: Font = Font.system(size: 18, weight: .semibold, design: .rounded),
                height: Double = 55,
                action: @escaping () -> Void) {
        
        self.title = title
        self.font = font
        self.height = height
        self.action = action
    }
}

@available(iOS 15.0, *)
struct DestructiveButton_Previews: PreviewProvider {
    static var previews: some View {
        DestructiveButton(title: "Delete Account") {}
    }
}
