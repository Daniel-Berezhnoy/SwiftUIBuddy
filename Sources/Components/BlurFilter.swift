//
//  BlurFilter.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

#warning("Figure out why it stretches on the y axis so much")
@available(iOS 15.0, *)
struct BlurFilter: View {
    
    @State private var blurEnabled = true { didSet { disableBlur(for: delay) } }
    let blurStyle: UIBlurEffect.Style
    let delay: Int
    
    public var body: some View {
        ZStack {
            if blurEnabled {
                blurBackground
                button
            }
        }
        .ignoresSafeArea()
    }
    
    var blurBackground: some View {
        BlurView(style: blurStyle).cornerRadius(25)
    }
    
    var button: some View {
        Button {
            withAnimation(.interactiveSpring()) { blurEnabled = false }
        } label: {
            label
        }
        .disabled(blurEnabled == false)
        
        .buttonStyle(.bordered)
    }
    
    var label: some View {
        ZStack {
//            if blurEnabled {
//                Rectangle()
//                    .frame(width: 200, height: 60)
//                    .foregroundStyle(.background)
//                    .cornerRadius(17)
//                    .opacity(0.75)
                
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
//            }
        }
        .foregroundStyle(.foreground)
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
        ZStack {
            Rectangle()
                .frame(width: 300, height: 300)
                .foregroundStyle(.cyan)
                .opacity(0.5)
                .cornerRadius(25)

            Text("Hi there! 👋")
                .font(.largeRounded)
        }
        .blurFilter()
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
