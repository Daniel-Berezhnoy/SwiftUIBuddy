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
    
    let size: CGFloat
    let placeholder: Placeholder
    
    let design: Font.Design
    let alignment: TextAlignment
    
    
    public var body: some View {
        TextField("$\(placeholder)", value: $amount, format: .currency(code: "USD"))
        
        
            .font(.system(size: size, weight: .semibold, design: design))
        
        
            .multilineTextAlignment(alignment)
            .keyboardType(.decimalPad)
            .minimumScaleFactor(0.9)
            .lineLimit(1)
    }
    
    public init(_ placeholder: String,
                amount: Binding <Double>,
                size: CGFloat = 50,
                design: Font.Design = .rounded,
                alignment: TextAlignment = .center) {
        
        _amount = amount
        self.size = size
        self.design = design
        self.alignment = alignment
        self.placeholder = placeholder
    }
    
    public typealias Placeholder = String
}

@available(iOS 15.0, *)
struct DollarTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            DollarTextField("4.50", amount: .constant(5))
            DollarTextField("3", amount: .constant(500), size: 25, design: .monospaced)
        }
    }
}
