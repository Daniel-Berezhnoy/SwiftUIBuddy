//
//  LoginField.swift
//  
//
//  Created by Daniel Berezhnoy on 1/16/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct LoginField: View {
    
    @Binding var text: String
    @FocusState private var focused: Bool
    @State private var passwordVisible = false
    
    let tint: Color
    let title: String
    let borderWidth: CGFloat
    let fieldType: LoginFieldType
    let titleOverlayMode: TitleOverlayMode
    let autocapitalization: TextInputAutocapitalization
    
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
            .overlay(dynamicTitleOverlay, alignment: .topLeading)
    }
    
    var dynamicBorder: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(tint.opacity(focused ? 1 : 0.8), lineWidth: dynamicBorderWidth)
    }
    
    var dynamicBorderWidth: CGFloat {
        let highlightedWidth = (borderWidth + borderWidth.getPercentage(45))
        return focused ? highlightedWidth : borderWidth
    }
    
    var dynamicTitleOverlay: some View {
        ZStack {
            if titleOverlayMode == .automatic {
                TitleLabel(title, presented: fieldHasEntry)
                    .foregroundColor(tint)
                    .animation(shortSpringAnimation, value: fieldHasEntry)
                
            } else if titleOverlayMode == .always {
                TitleLabel(title, presented: true)
                    .foregroundColor(tint)
                    .animation(shortSpringAnimation, value: fieldHasEntry)
                
            } else {
                EmptyView()
            }
        }
    }
    
    var textField: some View {
        AdaptiveTextField(title: title,
                          text: $text,
                          isPassword: fieldType == .password,
                          passwordVisible: $passwordVisible,
                          autocapitalization: autocapitalization)
        .focused($focused)
        .tint(tint == .primary ? .blue : tint.opacity(0.75))
    }
    
    var revealPasswordButton: some View {
        ZStack {
            if passwordFieldHasEntry {
                Button {
                    passwordVisible.toggle()
                } label: {
                    Image(systemName: passwordVisible ? "eye.fill" : "eye.slash.fill")
                        .animation(shortSpringAnimation, value: passwordVisible)
                        .foregroundStyle(.gray)
                        .padding(.trailing)
                        .saturation(2)
                }
            } else {
                EmptyView()
            }
        }
    }
    
    var shortSpringAnimation: Animation {
        .interactiveSpring(response: 0.1, dampingFraction: 1, blendDuration: 0.5)
    }
    
    var fieldHasEntry: Bool { !text.isEmpty }
    
    var passwordFieldHasEntry: Bool { fieldHasEntry && fieldType == .password }
    
    public enum LoginFieldType {
        case login, password
    }
    
    public enum TitleOverlayMode {
        case automatic, always, never
    }
    
    /// A beautiful TextField that is perfect for your app's Login Flow.
    /// It supports both Login and Password Fields, but you can use it for any other field.
    /// Initialize it just like a standard TextField, by passing in a Title and a Binding for the Text.
    /// To use for a password, specify .password for the fieldType. For more customization,
    /// specify the values for the Title Overlay Mode, Border Width, Autocapitalization Mode and Tint Color.
    public init(_ title: String,
                text: Binding<String>,
                fieldType: LoginFieldType = .login,
                titleOverlayMode: TitleOverlayMode = .automatic,
                borderWidth: CGFloat = 1.2,
                autocapitalization: TextInputAutocapitalization = .never,
                tint: Color = .primary) {
        
        _text = text
        self.tint = tint
        self.title = title
        self.fieldType = fieldType
        self.borderWidth = borderWidth
        self.titleOverlayMode = titleOverlayMode
        self.autocapitalization = autocapitalization
    }
}

@available(iOS 15.0, *)
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            LoginField("Email", text: .constant("daniel@iosdev.email"))
            LoginField("Password", text: .constant("superpassword12345"), fieldType: .password)
        }
        .padding(.horizontal, 20)
    }
}

@available(iOS 15.0, *)
struct TitleLabel: View {
    
    let title: String
    let presented: Bool
    
    var body: some View {
        if presented {
            Text(title)
                .font(.system(size: 13, design: .rounded))
                .padding(.vertical, 6.5)
                .padding(.horizontal, 5)
                .background(.background)
                .offset(x: 15, y: -15)
        }
    }
    
    init(_ title: String, presented: Bool) {
        self.title = title
        self.presented = presented
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
        if isPassword {
            passwordField
        } else {
            loginField
        }
    }
    
    var loginField: some View {
        TextField(title, text: $text)
            .font(.system(size: 19, weight: .light, design: .rounded))
            .textInputAutocapitalization(autocapitalization)
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
        .font(.system(size: passwordVisible ? 19 : 17, weight: .light, design: .rounded))
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
