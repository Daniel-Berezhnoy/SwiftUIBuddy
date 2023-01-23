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
    
    typealias Placeholder = String
    
    /// DollarTextField is a TextField specifically styled for handling input for currency values in USD.
    /// You initialize it with a String Placeholder value and a Binding to a Double for the Amount.
    /// For more customization, you can pass in any Size, Font Design and Alignment that you wish.
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
    
    /// DollarTextField is a TextField specifically styled for handling input for currency values in USD.
    /// You initialize it with a String Placeholder value and a Binding to a Double for the Amount.
    /// For more customization, you can pass in your Font of choice and specify the Alignment.
    public init(_ placeholder: String,
                amount: Binding <Double>,
                font: Font = .system(size: 50, weight: .semibold, design: .rounded),
                alignment: TextAlignment = .center) {
        
        _amount = amount
        self.font = font
        self.alignment = alignment
        self.placeholder = placeholder
        self.design = .default
        self.size = 50
    }
}

@available(iOS 15.0, *)
struct DollarTextField_Previews: PreviewProvider {
    static var previews: some View {
        DollarTextField("0", amount: .constant(5))
    }
}
