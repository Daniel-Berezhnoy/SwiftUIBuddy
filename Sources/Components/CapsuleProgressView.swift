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
    
    public var body: some View {
        ZStack(alignment: .leading) {
            baseLayer
            topLayer
        }
    }
    
    var baseLayer: some View {
        HStack(spacing: 3) {
            ForEach(0 ..< totalScreens - 1, id: \.self) { capsule in
                CapsuleBar(filled: false)
            }
        }
    }
    
    var topLayer: some View {
        HStack(spacing: 3) {
            
            if currentScreen - 1 <= totalScreens - 1 {
                ForEach(0 ..< onlyPositive(currentScreen - 1), id: \.self) { capsule in
                    CapsuleBar(filled: true)
                }
                
            } else {
                ForEach(0 ..< totalScreens - 1, id: \.self) { capsule in
                    CapsuleBar(filled: true)
                }
            }
        }
    }
    
    /// Description Here
    public init() {}
}

//@available (iOS 15.0, *)
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        CapsuleProgressView()
//    }
//}

@available(iOS 15.0, *)
struct CapsuleBar: View {
    @State var filled: Bool
    
    var body: some View {
        Capsule()
            .fill(filled ? Color.green : .secondary)
            .frame(width: 32, height: 8)
    }
}

func onlyPositive(_ value: Int) -> Int { value < 0 ? 0 : value }
