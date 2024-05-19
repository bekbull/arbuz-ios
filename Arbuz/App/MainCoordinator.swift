//
//  MainCoordinator.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import UIKit

final class MainCoordinator: RootViewControllerProvider {
    
    var rootViewController: UITabBarController
    
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UITabBarController()
        rootViewController.tabBar.unselectedItemTintColor = .black
        rootViewController.tabBar.tintColor = .green
        
    }
    
    func start() {
        
        let homeCoordinator = HomeCoordinator()
        homeCoordinator.start()
        self.childCoordinators.append(homeCoordinator)
        let firstViewController = homeCoordinator.rootViewController
        setup(vc: firstViewController,
              title: "Main",
              imageName: "house",
              selectedImageName: "house.fill")
        
        
        let basketCoordinator = BasketCoordinator()
        basketCoordinator.start()
        self.childCoordinators.append(basketCoordinator)
        let secondViewController = basketCoordinator.rootViewController
        setup(vc: secondViewController,
              title: "Basket",
              imageName: "cart",
              selectedImageName: "cart.fill")
        
        
        self.rootViewController.viewControllers = [firstViewController, secondViewController]
        
    }
    
    func setup(vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectedImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
