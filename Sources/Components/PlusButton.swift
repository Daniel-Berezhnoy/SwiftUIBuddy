//
//  PlusButton.swift
//  
//
//  Created by Daniel Berezhnoy on 1/7/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct PlusButton: View {
    
    let size: Double
    let color: Color
    let action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                circle
                plus
            }
        }
    }
    
    var circle: some View {
        Circle()
            .frame(width: size)
            .foregroundStyle(color)
    }
    
    var plus: some View {
        Image(systemName: "plus")
            .resizable()
            .scaledToFit()
            .font(.body.weight(.semibold))
            .foregroundColor(.white)
            .frame(width: size / 2.75)
    }
    
    /// A round-shaped Plus Button.
    /// Specify the color and put your action inside the closure.
    /// You can also pass in the size of the button (default is 55).
    public init(color: Color, size: Double = 55, action: @escaping () -> Void) {
        self.color = color
        self.size = size
        self.action = action
    }
}

@available(iOS 15.0, *)
struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton(color: .cyan, size: 60) {
            print("Plus Button is tapped")
        }
    }
}
