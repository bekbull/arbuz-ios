//
//  ProductCell.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 18.05.2024.
//

import UIKit

struct Product: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let price: String
    let unit: String
    let discount: String?
    let isDiscounted: Bool
}
