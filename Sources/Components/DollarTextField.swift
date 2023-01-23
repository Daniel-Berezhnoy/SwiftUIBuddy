//
//  DollarTextField.swift
//  
//
//  Created by Daniel Berezhnoy on 1/22/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct DollarTextField: View {
    
    let size: CGFloat
    let placeholder: String
    @Binding var amount: Double?
    var alignment: TextAlignment = .center
    var dollarKeyboardType: UIKeyboardType = .decimalPad
    
    public var body: some View {
        Text("Hello, World!")
    }
    
    public init() {}
}

@available(iOS 15.0, *)
struct DollarTextField_Previews: PreviewProvider {
    static var previews: some View {
        DollarTextField()
    }
}
