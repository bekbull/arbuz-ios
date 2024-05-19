//
//  ProductsViewController.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 18.05.2024.
//

import UIKit
import SwiftUI

final class ProductCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: ProductCollectionViewCell.self)
    
    private let hostingController = UIHostingController(rootView: MainViewCell(
        productImage: "",
        productTitle: "",
        productPrice: "",
        productUnit: "",
        productDiscount: "",
        isDiscounted: false
    ))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        hostingController.view.backgroundColor = .white
        contentView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product) {
        hostingController.rootView = MainViewCell(
            productImage: product.image,
            productTitle: product.title,
            productPrice: product.price,
            productUnit: product.unit,
            productDiscount: product.discount ?? "",
            isDiscounted: product.isDiscounted
        )
    }
}
final class ProductsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var products: [Product] = [
        Product(image: "apple_3", title: "Фарш KazBeef", price: "4 025 ₸", unit: "1 кг", discount: nil, isDiscounted: false),
        Product(image: "apple_3", title: "Перец полугорький красный кг", price: "1 566 ₸", unit: "0.6 кг", discount: nil, isDiscounted: false),
        Product(image: "apple_3", title: "Мороженое Mars батончик 41 г", price: "565 ₸", unit: "1 шт", discount: nil, isDiscounted: false),
        Product(image: "apple_3", title: "Перец полугорький зеленый", price: "4 698 ₸", unit: "1.8 кг", discount: nil, isDiscounted: false),
        Product(image: "apple_3", title: "Мандарины Турция кг", price: "2 840 ₸", unit: "2 кг", discount: "-36%", isDiscounted: true),
        Product(image: "apple_3", title: "Виноград красный Перу", price: "1 825 ₸", unit: "0.5 кг", discount: "-4%", isDiscounted: true)
    ]
    
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (view.frame.width / 3) - 16
        layout.itemSize = CGSize(width: itemWidth, height: 190)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        cell.configure(with: products[indexPath.item])
        return cell
    }
}

