//
//  View+Ext.swift
//  
//
//  Created by Daniel Berezhnoy on 1/28/23.
//

import SwiftUI

@available(iOS 15.0, *)
extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

@available(iOS 15.0, *)
struct BackgroundGeometryReader: View {
    var body: some View {
        GeometryReader { geoProxy in
            Color.clear.preference(key: SizePreferenceKey.self, value: geoProxy.size)
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
