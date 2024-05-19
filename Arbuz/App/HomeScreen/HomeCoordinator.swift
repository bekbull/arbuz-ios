//
//  HomeCoordinator.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import UIKit
import SwiftUI

class HomeCoordinator: NSObject, Coordinator {
    var rootViewController = UINavigationController()
    
    lazy var secondViewController: UIViewController = {
        let vc = ProductsViewController()
        vc.title = "Main"
        vc.view.backgroundColor = .cyan
        return vc
    }()
    
    
    func start() {
        rootViewController.setViewControllers([secondViewController], animated: false)
    }
}
