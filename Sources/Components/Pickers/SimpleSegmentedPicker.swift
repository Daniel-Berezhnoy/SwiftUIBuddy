//
//  SimpleSegmentedPicker.swift
//  
//
//  Created by Daniel Berezhnoy on 1/31/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SimpleSegmentedPicker: View {
    
    @Binding var selectedIndex: Int
    
    let choices: [String]
    let color: Color
    let font: Font
    
    public var body: some View {
        ZStack {
            geometryReader
            
            VStack(spacing: 0) {
                picker
                divider
            }
        }
    }
    
    @State private var labelSize: CGSize = .zero
    @State private var labelSizes: [CGSize] = []
    
    var geometryReader: some View {
        GeometryReader { geometry in
            Color.clear.onAppear { labelSize = geometry.size }
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
                .foregroundColor(color)
                .frame(width: selectedItemWidth, height: 2)
                .offset(x: calculateLineOffset)
        }
    }
    
    var divider: some View {
        VStack(spacing: 0) {
            Divider()
            Divider()
            Divider()
        }
    }
    
    var itemSpace: CGFloat {
        guard !labelSizes.isEmpty, !choices.isEmpty, labelSize.width != 0 else { return 0 }
        let itemWidthSum: CGFloat = labelSizes.map { $0.width }.reduce(0, +).rounded()
        let space = (labelSize.width - itemWidthSum) / CGFloat(choices.count + 1)
        return max(space, 0)
    }
    
    var selectedItemWidth: CGFloat {
        labelSizes.count > selectedIndex ? labelSizes[selectedIndex.onlyPositive()].width : .zero
    }
    
    var calculateLineOffset: CGFloat {
        guard selectedItemWidth != .zero, selectedIndex != 0 else { return 0 }
        
        let result = labelSizes
            .enumerated()
            .filter { $0.offset < selectedIndex }
            .map { $0.element.width }
            .reduce(0, +)
        
        return result + itemSpace * CGFloat(selectedIndex.onlyPositive())
    }
    
    func createLabel(for index: Int) -> some View {
        guard index < choices.count else { return EmptyView().eraseToAnyView() }
        let selected = selectedIndex.onlyPositive() == index
        
        return Text(choices[index])
            .font(font)
            .fontWeight(selected ? .semibold: .regular)
            .foregroundColor(selected ? color : .secondary)
            .background(BackgroundGeometryReader())
            .onPreferenceChange(SizePreferenceKey.self) { labelSizes[index] = $0 }
            .onTapGesture { withAnimation(.linear(duration: 0.15)) { changeSelection(to: index) } }
            .eraseToAnyView()
    }
    
    func changeSelection(to index: Int) {
        guard index < choices.count else { return }
        selectedIndex = index
    }
    
    /// Customizable Segmented Picker. To initialize, pass in an Array of Strings for all possible choices and a
    /// Binding to an Int for the Selected Index. For more customization, pass in Tint Color and Custom Font.
    public init(choices: [String],
                selectedIndex: Binding<Int>,
                tint: Color = .blue,
                font: Font = .system(size: 15)) {
        
        self.font = font
        self.color = tint
        self.choices = choices
        _selectedIndex = selectedIndex
        _labelSizes = State(initialValue: [CGSize](repeating: .zero, count: choices.count))
    }
}

@available(iOS 15.0, *)
struct SimpleSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SimpleSegmentedPicker(choices: ["Ramen", "Miso", "Pho"], selectedIndex: .constant(0))
    }
}
