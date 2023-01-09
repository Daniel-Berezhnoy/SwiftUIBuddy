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
            ZStack {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
                    .foregroundColor(color)
            }
        }
    }
    
    /// This button is great for dismissing things like Sheets, Popovers or Cards!
    /// Just specify the size and put your dismiss action inside the closure
    public init(size: Double, color: Color, action: @escaping () -> Void) {
        self.size = size
        self.color = color
        self.action = action
    }
}

@available(iOS 15.0, *)
struct DismissView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                Spacer()
                DismissButton(size: 30, color: .gray.opacity(0.75)) {
                    print("Dismiss")
                }
                .padding()
            }
            Spacer()
        }
    }
}
