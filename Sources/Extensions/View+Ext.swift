//
//  View+Ext.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

@available(iOS 15.0, *)
extension View {
     
    public func blurFilter(blurStyle: UIBlurEffect.Style = .regular, timer: Int = 5) -> some View {
        
        var viewWidth = 0.00
        var viewHeight = 0.00
        
        return ZStack {
            self.readSize { size in
                viewWidth = size.width
                viewHeight = size.height
                    
                print("View Width: \(viewWidth)")
                print("View Height: \(viewHeight) \n")
            }
            
            BlurFilter(blurStyle: blurStyle, timer: timer)
               
        }
        .frame(width: viewWidth, height: viewHeight)
    }

    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
