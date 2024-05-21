//
//  ProductService.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import Foundation

// Mock service to simulate fetching product data from a backend
final class ProductService {
    func fetchProductData(with id: Int, completion: @escaping (Product) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            // Mock product data
            let product = Product(image: "apple_3", title: "Виноград красный Перу", price: "1 825 ₸", unit: "0.5 кг", discount: "-4%", isDiscounted: true)

            DispatchQueue.main.async {
                completion(product)
            }
        }
    }
}

