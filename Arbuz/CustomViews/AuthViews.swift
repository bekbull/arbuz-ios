//
//  AuthViews.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import SwiftUI

struct AuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        if isSecure {
            SecureField(placeholder, text: $text)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        } else {
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
    }
}

struct AuthButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}

