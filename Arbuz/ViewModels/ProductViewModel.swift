//
//  ProductViewModel.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import Foundation
import Combine

final class ProductViewModel: ObservableObject {
    @Published var product: Product?
    private var productService: ProductService
    private var id: Int

    init(productService: ProductService, with id: Int) {
        self.productService = productService
        self.id = id
        fetchProduct()
    }

    func fetchProduct() {
        productService.fetchProductData(with: id) { [weak self] product in
            self?.product = product
        }
    }
}

