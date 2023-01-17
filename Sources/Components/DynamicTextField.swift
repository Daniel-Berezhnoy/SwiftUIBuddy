//
//  DynamicTextField.swift
//  
//
//  Created by Daniel Berezhnoy on 1/16/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct DynamicTextField: View {
    
    public var body: some View {
        Text("Hello, World!")
    }
    
    public init() {}
}

@available(iOS 15.0, *)
struct DynamicTextField_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextField()
//        AdaptiveTextField(title: "Hello",
//                          text: .constant("Hi"),
//                          isPassword: true,
//                          passwordVisible: .constant(false),
//                          autocapitalization: .never)
    }
}

@available(iOS 15.0, *)
struct TextFieldBorderOverlay: View {
    
    var presented: Bool
    var title: String
    
    var body: some View {
        if presented {
            Text(title)
                .font(Font.custom("Montserrat", size: 13))
                .padding(6)
                .background(Color.background)
                .offset(x: 15, y: -15)
        }
    }
}

@available(iOS 15.0, *)
struct AdaptiveTextField: View {
    
    @Binding var passwordVisible: Bool
    @Binding var text: String
    
    let autocapitalization: TextInputAutocapitalization
    let isPassword: Bool
    let title: String
    
    var body: some View {
        if isPassword { passwordField } else { loginField }
    }
    
    var passwordField: some View {
        ZStack {
            if passwordVisible {
                TextField(title, text: $text)
            } else {
                SecureField(title, text: $text)
            }
        }
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .font(Font.custom("Montserrat", size: 17))
        .padding(.leading)
        .padding(.vertical)
    }
    
    var loginField: some View {
        TextField(title, text: $text)
            .textInputAutocapitalization(autocapitalization)
            .disableAutocorrection(true)
            .font(Font.custom("Montserrat", size: 17))
            .padding()
    }
    
    init(title: String,
         text: Binding<String>,
         isPassword: Bool,
         passwordVisible: Binding<Bool>,
         autocapitalization: TextInputAutocapitalization) {
        
        _text = text
        self.title = title
        self.isPassword = isPassword
        _passwordVisible = passwordVisible
        self.autocapitalization = autocapitalization
    }
}
