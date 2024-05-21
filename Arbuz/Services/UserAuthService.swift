//
//  UserAuthService.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import Foundation
import Combine

final class UserAuthService {
    func signIn(email: String, password: String) -> AnyPublisher<Bool, Error> {
        // Simulate network request with a delay
        return Future<Bool, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                if email == "test@example.com" && password == "password" {
                    promise(.success(true))
                } else {
                    promise(.failure(NSError(domain: "Invalid credentials", code: 401, userInfo: nil)))
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }

    func signUp(name: String, email: String, password: String) -> AnyPublisher<Bool, Error> {
        // Simulate network request with a delay
        return Future<Bool, Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                if email == "test@example.com" {
                    promise(.failure(NSError(domain: "Email already in use", code: 409, userInfo: nil)))
                } else {
                    promise(.success(true))
                }
            }
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}

