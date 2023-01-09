//
//  CapsuleProgressView.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

@available (iOS 15.0, *)
public struct CapsuleProgressView: View {
    
    let totalScreens: Int
    let currentScreen: Int
    
    let color: Color
    
    public var body: some View {
        ZStack(alignment: .leading) {
            baseLayer
            topLayer
        }
    }
    
    var baseLayer: some View {
        HStack(spacing: 3) {
            ForEach(0 ..< totalScreens - 1, id: \.self) { capsule in
                CapsuleBar(filled: false, color: color)
            }
        }
    }
    
    var topLayer: some View {
        HStack(spacing: 3) {
            if currentScreen <= totalScreens {
                ForEach(0 ..< onlyPositive(currentScreen - 1), id: \.self) { capsule in
                    CapsuleBar(filled: true, color: color)
                }
                
            } else {
                ForEach(0 ..< totalScreens - 1, id: \.self) { capsule in
                    CapsuleBar(filled: true, color: color)
                }
            }
        }
    }
    
    /// Description Here
    public init(totalScreens: Int, currentScreen: Int, color: Color) {
        self.totalScreens = totalScreens
        self.currentScreen = currentScreen
        self.color = color
    }
}

@available (iOS 15.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleProgressView(totalScreens: 4, currentScreen: 2, color: .orange)
    }
}

@available(iOS 15.0, *)
public struct CapsuleBar: View {
    
    @State var filled: Bool
    let color: Color
    
    public var body: some View {
        Capsule()
            .fill(filled ? color : .secondary.opacity(0.4))
            .frame(width: 32, height: 8)
    }
}

@available(iOS 15.0, *)
func onlyPositive(_ value: Int) -> Int { value < 0 ? 0 : value }
