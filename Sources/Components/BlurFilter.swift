//
//  BlurFilter.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct BlurFilter: View {
    
    @State private var blurEnabled = true
    
    public var body: some View {
        ZStack {
            baseLayer
            blurLayer
        }
        .frame(width: 200, height: 200)
    }
    
    var baseLayer: some View {
        //        Image(systemName: "eye")
        //            .resizable()
        //            .scaledToFit()
        //            .padding()
        
        Rectangle()
            .foregroundStyle(.orange)
            .cornerRadius(30)
    }
    
    var blurLayer: some View {
        ZStack {
            if blurEnabled { BlurView(style: .regular) }
            button
        }
    }
    
    var button: some View {
        Button {
            withAnimation { blurEnabled.toggle() }
        } label: {
            if blurEnabled { label }
        }
    }
    
    var label: some View {
        ZStack {
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
        .foregroundStyle(.white)
        .padding()
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
