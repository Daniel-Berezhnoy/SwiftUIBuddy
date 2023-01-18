//
//  RadioPicker.swift
//  
//
//  Created by Daniel Berezhnoy on 1/16/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct RadioPicker: View {
    @Binding var selectedChoice: String
    
    let choices: [String]
    let color: Color
    let font: Font
    
    public var body: some View {
        ScrollView {
            ForEach(0 ..< choices.count, id: \.self) { cell in
                RadioCell(choices[cell], selectedValue: $selectedChoice, color: color, font: font)
                    .onTapGesture { selectedChoice = choices[cell] }
            }
        }
    }
    
    /// Radio Button-Styled Picker for iOS.
    /// Pass in a [String] for all possible choices and a Binding<String> for selected choice.
    /// For more customization, pass in a highlightColor and custom Font.
    public init(choices: [String],
                selectedChoice: Binding<String>,
                highlightColor: Color = .blue,
                font: Font = .system(size: 16, weight: .light)) {
        
        self.choices = choices
        _selectedChoice = selectedChoice
        self.color = highlightColor
        self.font = font
    }
}

@available(iOS 15.0, *)
struct RadioPicker_Previews: PreviewProvider {
    static var previews: some View {
        RadioPicker(choices: ["Male", "Female", "Non-Binary"],
                    selectedChoice: .constant("Male"))
        .padding(.horizontal, 25)
    }
}

@available(iOS 15.0, *)
struct RadioCell: View {
    @Binding var selectedValue: String
    
    let title: String
    let color: Color
    let font: Font
    
    var body: some View {
        HStack {
            radioButton
            text
            Spacer()
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
    
    var radioButton: some View {
        Image(systemName: selected ? "smallcircle.filled.circle.fill" : "circle")
            .resizable()
            .scaledToFit()
            .frame(width: 20)
            .foregroundColor(selected ? color : .gray.opacity(0.6))
            .font(.system(size: 25, weight: .heavy))
    }
    
    var text: some View {
        Text(title)
            .font(font)
            .padding(.leading, 2)
            .lineLimit(1)
    }
    
    var selected: Bool { withAnimation { title == selectedValue } }
    
    #warning("FIX THIS")
    /// ADD DOCUMENTATION
    init(_ title: String, selectedValue: Binding<String>, color: Color, font: Font) {
        self.title = title
        _selectedValue = selectedValue
        self.color = color
        self.font = font
    }
}