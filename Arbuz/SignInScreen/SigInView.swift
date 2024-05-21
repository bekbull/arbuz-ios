//
//  SigInView.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel: SignInViewModel

    init(viewModel: SignInViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 16) {
            AuthTextField(placeholder: "Email", text: $viewModel.email)
            AuthTextField(placeholder: "Password", text: $viewModel.password, isSecure: true)
            AuthButton(title: "Sign In") {
                viewModel.signIn()
            }
        }
        .padding()
    }
}
