//
//  NetworkManager.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 21.05.2024.
//

import UIKit
import Combine

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: URL) -> AnyPublisher<UIImage?, Never> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response in
                return UIImage(data: data)
            }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

