//
//  SignUpView.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel: SignUpViewModel

    init(viewModel: SignUpViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 16) {
            AuthTextField(placeholder: "Name", text: $viewModel.name)
            AuthTextField(placeholder: "Email", text: $viewModel.email)
            AuthTextField(placeholder: "Password", text: $viewModel.password, isSecure: true)
            AuthButton(title: "Sign Up") {
                viewModel.signUp()
            }
        }
        .padding()
    }
}
