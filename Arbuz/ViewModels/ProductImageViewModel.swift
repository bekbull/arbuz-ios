//
//  ProductImageViewModel.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 21.05.2024.
//

import Combine
import SwiftUI

final class ProductImageViewModel: ObservableObject {
    @Published var image: UIImage?
    private var cancellables = Set<AnyCancellable>()
    
    func fetchImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchImage(from: url)
            .sink { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}

