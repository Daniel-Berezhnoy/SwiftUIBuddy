//
//  LoginField.swift
//  
//
//  Created by Daniel Berezhnoy on 1/16/23.
//

import SwiftUI

@available(iOS 15.0, *)
struct LoginField: View {
    
    @State private var passwordVisible = false
    @FocusState private var focused: Bool
    @Binding var text: String
    
    let autocapitalization: TextInputAutocapitalization
    let isPassword: Bool
    let title: String
    
    public var body: some View {
        Text("Hello, World!")
    }
    
    public init(_ title: String,
         text: Binding<String>,
         isPassword: Bool = false,
         autocapitalization: TextInputAutocapitalization = .never) {
        
        _text = text
        self.title = title
        self.isPassword = isPassword
        self.autocapitalization = autocapitalization
    }
}

@available(iOS 15.0, *)
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        LoginField("Hello", text: .constant("Hello"))
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
        if !isPassword { loginField } else { passwordField }
    }
    
    var loginField: some View {
        TextField(title, text: $text)
            .textInputAutocapitalization(autocapitalization)
            .disableAutocorrection(true)
            .font(Font.custom("Montserrat", size: 17))
            .padding()
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
