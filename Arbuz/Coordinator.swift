//
//  Coordinator.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import UIKit

protocol Coordinator {
    func start()
}

protocol RootViewControllerProvider: Coordinator {
    associatedtype RootViewControllerType
    var rootViewController: RootViewControllerType { get }
}
