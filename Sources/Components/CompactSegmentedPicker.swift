//
//  CompactSegmentedPicker.swift
//  
//
//  Created by Daniel Berezhnoy on 1/31/23.
//

import SwiftUI

#warning("Working in this View")
@available(iOS 15.0, *)
public struct CompactSegmentedPicker: View {
    
    @Binding var selection: Int
    let items: [String]
    
    public var body: some View {
        ZStack {
            geometryReader
            
            VStack(spacing: 0) {
                picker
                divider
            }
        }
    }
    
    @State private var segmentSize: CGSize = .zero
    @State private var itemTitleSizes: [CGSize] = []
    
    var geometryReader: some View {
        GeometryReader { geometry in
            Color.clear.onAppear { segmentSize = geometry.size }
        }
        .frame(maxWidth: .infinity, maxHeight: 1)
    }
    
    var picker: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            // Title
            HStack(spacing: xSpace) {
                ForEach(0 ..< items.count, id: \.self) { index in
                    segmentLabel(for: index)
                }
            }
            
            // Line
            Rectangle()
                .foregroundColor(.green)
                .frame(width: selectedItemWidth, height: 2)
                .offset(x: calculateLineOffset)
        }
    }
    
    var divider: some View {
        VStack(spacing: 0) {
            Divider()
            Divider()
        }
    }
    
    var xSpace: CGFloat {
        guard !itemTitleSizes.isEmpty,
              !items.isEmpty,
              segmentSize.width != 0 else { return 0 }
        
        let itemWidthSum: CGFloat = itemTitleSizes.map { $0.width }.reduce(0, +).rounded()
        let space = (segmentSize.width - itemWidthSum) / CGFloat(items.count + 1)
        return max(space, 0)
    }
    
    var selectedItemWidth: CGFloat {
        itemTitleSizes.count > selection ? itemTitleSizes[selection].width : .zero
    }
    
    var calculateLineOffset: CGFloat {
        guard selectedItemWidth != .zero, selection != 0 else { return 0 }
        
        let result = itemTitleSizes
            .enumerated()
            .filter { $0.offset < selection }
            .map { $0.element.width }
            .reduce(0, +)
        
        return result + xSpace * CGFloat(selection)
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
    
    /// ADD DESCRIPTION
    public init(items: [String], selection: Binding<Int>) {
        self.items = items
        _selection = selection
        _itemTitleSizes = State(initialValue: [CGSize](repeating: .zero, count: items.count))
    }
}

@available(iOS 15.0, *)
struct CompactSegmentedPicker_Previews: PreviewProvider {
    @State static private var selectedPage = 0
    
    static var previews: some View {
//        VStack(spacing: 0) {
            CompactSegmentedPicker(items: ["Blue", "Green", "Red"], selection: $selectedPage)
            
//            switch selectedPage {
//                case 0: Color.blue
//                case 1: Color.green
//                case 2: Color.red
//                default: Color.clear
//            }
//        }
//        .frame(height: 300)
    }
}
