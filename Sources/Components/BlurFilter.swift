//
//  BlurFilter.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct BlurFilter: View {
    
    @State private var blurEnabled = true { didSet { disableBlur(for: delay) } }
    let blurStyle: UIBlurEffect.Style
    let delay: Int
    
    public var body: some View {
        ZStack {
            if blurEnabled { BlurView(style: blurStyle) }
            button
        }
    }
    
    var button: some View {
        Button {
            withAnimation(.interactiveSpring()) { blurEnabled = false }
        } label: {
            label
        }
        .disabled(blurEnabled == false)
    }
    
    var label: some View {
        ZStack {
            if blurEnabled {
                if #available(iOS 16.0, *) {
                    Label("Show Content", systemImage: "eye.slash.fill")
                        .fontWeight(.semibold)
                } else {
                    HStack {
                        Image(systemName: "eye.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                        
                        Text("Show Content")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
//        .foregroundStyle(.white)
        .foregroundStyle(.primary)
        .padding()
    }
    
    func disableBlur(for seconds: Int) {
        let delay = DispatchTimeInterval.seconds(seconds)
        
        if blurEnabled == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation { blurEnabled = true }
            }
        }
    }
    
    public init(blurStyle: UIBlurEffect.Style = .regular, timer: Int = 5) {
        self.delay = timer
        self.blurStyle = blurStyle
    }
}

@available(iOS 15.0, *)
struct BlurFilter_Previews: PreviewProvider {
    static var previews: some View {
        BlurFilter()
    }
}

@available(iOS 15.0, *)
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
