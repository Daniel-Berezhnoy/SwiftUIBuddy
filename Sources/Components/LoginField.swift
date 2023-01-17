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
            dynamicBorder
            
            HStack {
                textField
                revealPasswordButton
            }
        }
    }
    
    var dynamicBorder: some View {
        Rectangle()
            .frame(height: 60)
            .foregroundColor(.clear)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(.primary, lineWidth: 0.75))
            .overlay(TextFieldBorderOverlay(presented: highlighted, title: title),
                     alignment: .topLeading)
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
        LoginField("User Name", text: .constant("daniel@iosdev.email"), isPassword: true)
            .padding()
    }
}

#warning("⬇️ Change the Fonts ⬇️")
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
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .font(Font.custom("Montserrat", size: 17))
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
