//
//  CompactSegmentedPicker.swift
//  
//
//  Created by Daniel Berezhnoy on 1/31/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CompactSegmentedPicker: View {
    
    @Binding var selectedIndex: Int
    let choices: [String]
    
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
            HStack(spacing: itemSpace) {
                ForEach(0 ..< choices.count, id: \.self) { index in
                    createLabel(for: index)
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
    
    var itemSpace: CGFloat {
        guard !itemTitleSizes.isEmpty, !choices.isEmpty, segmentSize.width != 0 else { return 0 }
        let itemWidthSum: CGFloat = itemTitleSizes.map { $0.width }.reduce(0, +).rounded()
        let space = (segmentSize.width - itemWidthSum) / CGFloat(choices.count + 1)
        return max(space, 0)
    }
    
    var selectedItemWidth: CGFloat {
        itemTitleSizes.count > selectedIndex ? itemTitleSizes[selectedIndex].width : .zero
    }
    
    var calculateLineOffset: CGFloat {
        guard selectedItemWidth != .zero, selectedIndex != 0 else { return 0 }
        
        let result = itemTitleSizes
            .enumerated()
            .filter { $0.offset < selectedIndex }
            .map { $0.element.width }
            .reduce(0, +)
        
        return result + itemSpace * CGFloat(selectedIndex)
    }
    
    func createLabel(for index: Int) -> some View {
        guard index < choices.count else { return EmptyView().eraseToAnyView() }
        let isSelected = selectedIndex == index
        
        return Text(choices[index])
            .font(Font.custom("Montserrat", size: 14))
            .fontWeight(isSelected ? .semibold: .medium)
            .foregroundColor(isSelected ? .green : .primary)
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SizePreferenceKey.self) { itemTitleSizes[index] = $0 }
            .onTapGesture { withAnimation(.linear(duration: 0.15)) { changeSelection(to: index) } }
            .eraseToAnyView()
    }
    
    func changeSelection(to index: Int) {
        guard index < choices.count else { return }
        selectedIndex = index
    }
    
    /// ADD DESCRIPTION
    public init(choices: [String], selectedIndex: Binding<Int>) {
        self.choices = choices
        _selectedIndex = selectedIndex
        _itemTitleSizes = State(initialValue: [CGSize](repeating: .zero, count: choices.count))
    }
}

@available(iOS 15.0, *)
struct CompactSegmentedPicker_Previews: PreviewProvider {
    @State static private var selectedPage = 0
    
    static var previews: some View {
        VStack {
            CompactSegmentedPicker(choices: ["Blue", "Green", "Red"], selectedIndex: $selectedPage)
            selectedColor
        }
    }
    
    static var selectedColor: some View {
        ZStack {
            switch selectedPage {
                case 0: Color.blue
                case 1: Color.green
                case 2: Color.red
                default: Color.clear
            }
        }
        .frame(height: 300)
    }
}
