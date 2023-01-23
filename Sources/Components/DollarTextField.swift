//
//  DollarTextField.swift
//  
//
//  Created by Daniel Berezhnoy on 1/22/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DollarTextField: View {
    
    @Binding var amount: Double
    
    let font: Font
    let size: CGFloat
    let design: Font.Design
    
    let alignment: TextAlignment
    let placeholder: Placeholder
    
    public var body: some View {
        TextField("$\(placeholder)", value: $amount, format: .currency(code: "USD"))
            .multilineTextAlignment(alignment)
            .keyboardType(.decimalPad)
            .minimumScaleFactor(0.9)
            .lineLimit(1)
            .font(font)
    }
    
    public init(_ placeholder: String,
                amount: Binding <Double>,
                font: Font = .system(size: 50, weight: .semibold, design: .rounded),
                alignment: TextAlignment = .center) {
        
        _amount = amount
        self.font = font
        self.alignment = alignment
        self.placeholder = placeholder
        
        self.size = 50
        self.design = .default
    }
    
    public init(_ placeholder: String,
                amount: Binding <Double>,
                size: CGFloat = 50,
                design: Font.Design = .rounded,
                alignment: TextAlignment = .center) {
        
        _amount = amount
        self.size = size
        self.design = design
        self.font = .system(size: size, weight: .semibold, design: design)
        self.alignment = alignment
        self.placeholder = placeholder
    }
    
    typealias Placeholder = String
}

@available(iOS 15.0, *)
struct DollarTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
//            DollarTextField("4.50", amount: .constant(5))
//            DollarTextField("3", amount: .constant(500), size: 16)
            
            DollarTextField("33.30",
                            amount: .constant(5),
                            size: 60,
                            design: .rounded,
                            alignment: .center)
            
            DollarTextField("22.20",
                            amount: .constant(5),
                            font: .system(size: 30, weight: .light, design: .monospaced),
                            alignment: .center)
        }
    }
}
