//
//  BlurEffect.swift
//  
//
//  Created by Daniel Berezhnoy on 1/27/23.
//

//import SwiftUI
//
//@available(iOS 15.0, *)
//struct BlurEffect: View {
//
//    @State private var blurEnabled = true
//
//    public var body: some View {
//        ZStack {
//            testContent.blur(radius: blurEnabled ? 5 : 0)
//
//            showContentButton
//        }
//    }
//
//    var testContent: some View {
//        ZStack {
//            Rectangle()
//                .foregroundStyle(.orange)
//                .cornerRadius(20)
//
//            Text("The company confirmed on Friday that Twitter users accessing the social media platform on Android, iOS, and the web can now add content warnings to any photos or videos attached to their tweets.")
//                .padding()
//                .foregroundStyle(.white)
//        }
//        .frame(width: 300, height: 600)
//    }
//
//    var showContentButton: some View {
//        Button {
//            withAnimation { blurEnabled.toggle() }
//        } label: {
//            ZStack { if blurEnabled { showContentLabel } else { EmptyView() } }
//                .foregroundStyle(.white)
//                .padding()
//        }
//    }
//
//    var showContentLabel: some View {
//        ZStack {
//            if #available(iOS 16.0, *) {
//                Label("Show Content", systemImage: "eye.slash.fill")
//                    .fontWeight(.semibold)
//            } else {
//                VStack {
//                    Image(systemName: "eye.slash.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 25)
//
//                    Text("Show Content")
//                        .fontWeight(.semibold)
//                }
//            }
//        }
//    }
//
//    public init() {}
//}
//
//@available(iOS 15.0, *)
//struct BlurEffect_Previews: PreviewProvider {
//    static var previews: some View {
//        BlurEffect()
//    }
//}
