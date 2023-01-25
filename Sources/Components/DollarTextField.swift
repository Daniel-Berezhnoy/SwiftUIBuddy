//
//  DollarTextField.swift
//  
//
//  Created by Daniel Berezhnoy on 1/22/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DollarTextField: View {
    
    @Binding var amount: Double?
    let placeholder: Double
    
    let font: Font
    let size: CGFloat
    let design: Font.Design
    let alignment: TextAlignment
    
    public var body: some View {
        TextField("$\(placeholder, specifier: "%.2f")",
                  value: $amount,
                  format: .currency(code: "USD"))
            .multilineTextAlignment(alignment)
            .keyboardType(.decimalPad)
            .minimumScaleFactor(0.9)
            .lineLimit(1)
            .font(font)
    }
    
    /// DollarTextField is a TextField styled for handling USD currency values.
    /// You initialize it with a Double Placeholder value and a Binding to a Double for the Amount.
    /// Please specify the amount to use this View. If you want ti show the placeholder by default, set the value to nil.
    /// For more customization, you can pass in any Size, Font Design and Alignment that you wish.
    public init(_ placeholder: Double,
                amount: Binding <Double?> = .constant(nil),
                size: CGFloat = 50,
                design: Font.Design = .rounded,
                alignment: TextAlignment = .center) {
        
        _amount = amount
        self.size = size
        self.design = design
        self.alignment = alignment
        self.placeholder = placeholder
        self.font = .system(size: size, weight: .semibold, design: design)
    }
    
    /// DollarTextField is a TextField styled for handling USD currency values.
    /// You initialize it with a Double Placeholder value and a Binding to a Double for the Amount.
    /// Please specify the amount to use this View. If you want ti show the placeholder by default, set the value to nil.
    /// For more customization, you can pass in your Font of choice and specify the Alignment.
    public init(_ placeholder: Double,
                amount: Binding <Double?> = .constant(nil),
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
        DollarTextField(9.40, size: 75)
    }
}
