//
//  BasketCoordinator.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import UIKit

class BasketCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: UIViewController = {
        let vc = UIViewController()
        vc.title = "Basket"
        vc.view.backgroundColor = .brown
        return vc
    }()
    
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
