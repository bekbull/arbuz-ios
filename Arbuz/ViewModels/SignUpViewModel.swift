//
//  SignUpViewModel.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    private let authService: UserAuthService
    private var cancellables = Set<AnyCancellable>()

    init(authService: UserAuthService) {
        self.authService = authService
    }

    func signUp() {
        authService.signUp(name: name, email: email, password: password)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Sign up successful")
                case .failure(let error):
                    print("Sign up failed: \(error.localizedDescription)")
                }
            }, receiveValue: { success in
                // Handle sign up success
            })
            .store(in: &cancellables)
    }
}
