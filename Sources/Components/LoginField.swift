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
        ZStack {
            border
            
            HStack {
                textField
                revealPasswordButton
            }
        }
    }
    
    var border: some View {
        Rectangle()
            .frame(height: 60)
            .foregroundColor(.clear)
            .overlay(dynamicBorder)
            .overlay(textLabel, alignment: .topLeading)
    }
    
    var dynamicBorder: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(focused ? Color.primary : .primary.opacity(0.6), lineWidth: 1)
    }
    
    var textLabel: some View {
        TextFieldLabel(presented: highlighted, title: title)
    }
    
    var textField: some View {
        AdaptiveTextField(title: title,
                          text: $text,
                          isPassword: isPassword,
                          passwordVisible: $passwordVisible,
                          autocapitalization: autocapitalization)
        .focused($focused)
    }
    
    var revealPasswordButton: some View {
        ZStack {
            if passwordFieldActive {
                Button {
                    passwordVisible.toggle()
                } label: {
                    Image(systemName: passwordVisible ? "eye.fill" : "eye.slash.fill")
                        .animation(.spring(), value: passwordVisible)
                        .foregroundStyle(.gray)
                        .padding(.trailing)
                        .saturation(2)
                }
            } else {
                EmptyView()
            }
        }
    }
    
    var highlighted: Bool { focused || !text.isEmpty }
    
    var passwordFieldActive: Bool { isPassword && highlighted && !text.isEmpty }
    
    /// ADD THE DESCRIPTION HERE
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
        VStack(spacing: 25) {
            LoginField("Email", text: .constant("daniel@iosdev.email"))
            LoginField("Password", text: .constant("superpassword12345"), isPassword: true)
        }
        .padding(.horizontal, 20)
    }
}

@available(iOS 15.0, *)
struct TextFieldLabel: View {
    
    var presented: Bool
    var title: String
    
    var body: some View {
        if presented {
            Text(title)
                .font(.system(size: 13, design: .rounded))
                .padding(.vertical, 6.5)
                .padding(.horizontal, 4)
                .background(.background)
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
            .font(.system(size: 18, weight: .light, design: .rounded))
            .disableAutocorrection(true)
            .padding(.trailing, 6)
            .padding(.leading)
    }
    
    var passwordField: some View {
        ZStack {
            if passwordVisible {
                TextField(title, text: $text)
            } else {
                SecureField(title, text: $text)
            }
        }
        .font(.system(size: 18, weight: .light, design: .rounded))
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .padding(.leading)
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
