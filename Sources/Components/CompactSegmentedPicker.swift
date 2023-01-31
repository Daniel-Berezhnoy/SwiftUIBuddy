//
//  CompactSegmentedPicker.swift
//  
//
//  Created by Daniel Berezhnoy on 1/31/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CompactSegmentedPicker: View {
    
    @State private var segmentSize: CGSize = .zero
    @State private var itemTitleSizes: [CGSize] = []
    
    private let items: [String]
    @Binding var selection: Int
    
    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                Color.clear.onAppear { segmentSize = geometry.size }
            }
            .frame(maxWidth: .infinity, maxHeight: 1)
            
            VStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: 0) {
                    
                    HStack(spacing: xSpace) {
                        ForEach(0 ..< items.count, id: \.self) { index in
                            segmentLabel(for: index)
                        }
                    }
                    .padding(.bottom, 4)
                    
                    // Bottom Line
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: selectedItemWidth, height: 2)
                        .offset(x: selectedItemHorizontalOffset(), y: 0)
                }
                
                Divider()
                Divider()
            }
        }
    }
    
    var selectedItemWidth: CGFloat {
        itemTitleSizes.count > selection ?
        itemTitleSizes[selection].width : .zero
    }
    
    var xSpace: CGFloat {
        guard !itemTitleSizes.isEmpty,
              !items.isEmpty,
              segmentSize.width != 0 else { return 0 }
        
        let itemWidthSum: CGFloat = itemTitleSizes.map { $0.width }.reduce(0, +).rounded()
        let space = (segmentSize.width - itemWidthSum) / CGFloat(items.count + 1)
        return max(space, 0)
    }
    
    func segmentLabel(for index: Int) -> some View {
        guard index < self.items.count else {
            return EmptyView().eraseToAnyView()
        }
        
        let isSelected = self.selection == index
        
        return Text(items[index])
            .font(Font.custom("Montserrat", size: 14))
            .fontWeight(isSelected ? .semibold: .medium)
            .foregroundColor(isSelected ? .green : .primary)
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SizePreferenceKey.self) { itemTitleSizes[index] = $0 }
            .onTapGesture {
                withAnimation(.linear(duration: 0.15)) {
                    onItemTap(index: index)
                }
            }
            .eraseToAnyView()
    }
    
    func onItemTap(index: Int) {
        guard index < self.items.count else { return }
        self.selection = index
    }
    
    func selectedItemHorizontalOffset() -> CGFloat {
        guard selectedItemWidth != .zero, selection != 0 else { return 0 }
        
        let result = itemTitleSizes
            .enumerated()
            .filter { $0.offset < selection }
            .map { $0.element.width }
            .reduce(0, +)
        
        return result + xSpace * CGFloat(selection)
    }
    
    public init(items: [String], selection: Binding<Int>) {
        self._selection = selection
        self.items = items
        self._itemTitleSizes = State(initialValue: [CGSize](repeating: .zero,
                                                            count: items.count))
    }
}

@available(iOS 15.0, *)
struct CompactSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        CompactSegmentedPicker(items: ["Number 1", "Numero 2", "# 3"], selection: .constant(1))
    }
}

//@available(iOS 15.0, *)
//struct SizePreferenceKey: PreferenceKey {
//    public typealias Value = CGSize
//    public static var defaultValue: Value = .zero
//
//    public static func reduce(value: inout Value, nextValue: () -> Value) {
//        value = nextValue()
//    }
//}

@available(iOS 15.0, *)
struct BackgroundGeometryReader: View {
    public var body: some View {
        GeometryReader { geoProxy in
            Color.clear.preference(key: SizePreferenceKey.self, value: geoProxy.size)
        }
    }
    public init() {}
}

@available(iOS 15.0, *)
public extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
