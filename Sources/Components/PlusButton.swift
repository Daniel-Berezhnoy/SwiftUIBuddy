//
//  PlusButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/7/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct PlusButton: View {
    
    let size: Double
    let color: Color
    let action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .frame(width: size)
                    .foregroundColor(color)
                
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: size / 2.75)
            }
        }
    }
    
    public init(size: Double, color: Color, action: @escaping () -> Void) {
        self.size = size
        self.color = color
        self.action = action
    }
}

@available(iOS 15.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(size: 100, color: .orange) {
            print("Plus Button is tapped")
        }
    }
}
