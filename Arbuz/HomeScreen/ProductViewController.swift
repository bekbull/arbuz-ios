//
//  ProductViewController.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 20.05.2024.
//

import UIKit
import SwiftUI

final class ProductViewController: UIViewController {
    
    private var id: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the ProductService, ViewModel, and SwiftUI View
        let productService = ProductService()
        let viewModel = ProductViewModel(productService: productService, with: 15)
        let productView = DetailView(viewModel: viewModel)
        
        // Embed the SwiftUI view in a UIHostingController
        let hostingController = UIHostingController(rootView: productView)
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Configure the hosting controller's view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Notify the hosting controller that it has been moved to the parent
        hostingController.didMove(toParent: self)
    }
    
    init(with id: Int) {
        super.init(nibName: nil, bundle: nil)
        self.id = id
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

