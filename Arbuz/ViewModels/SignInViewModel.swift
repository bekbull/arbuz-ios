//
//  SignInViewModel.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let authService: UserAuthService
    private var cancellables = Set<AnyCancellable>()

    init(authService: UserAuthService) {
        self.authService = authService
    }

    func signIn() {
        authService.signIn(email: email, password: password)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Sign in successful")
                case .failure(let error):
                    print("Sign in failed: \(error.localizedDescription)")
                }
            }, receiveValue: { success in
                // Handle sign in success
            })
            .store(in: &cancellables)
    }
}

