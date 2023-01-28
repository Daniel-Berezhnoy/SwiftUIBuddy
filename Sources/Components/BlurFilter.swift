//
//  BlurFilter.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct BlurFilter: View {
    
    public var body: some View {
        ZStack {
            GeometryReader { proxy in
                let frame = proxy.frame(in: .global)
                
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: frame.size.width, height: frame.size.height)
            }
            
            GeometryReader { proxy in
                BlurView(style: .dark)
            }
        }
        .ignoresSafeArea()
    }
    
    public init() {}
}

@available(iOS 15.0, *)
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

@available(iOS 15.0, *)
struct BlurFilter_Previews: PreviewProvider {
    static var previews: some View {
        BlurFilter()
    }
}
