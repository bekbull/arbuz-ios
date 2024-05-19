//
//  AppCoordinator.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import SwiftUI
import UIKit
import Combine

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    
    var childCoordinators = [Coordinator]()
    
    let hasSeenOnboarding = CurrentValueSubject<Bool,Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    func start() {
        
        setupOnboardingValue()
        
        hasSeenOnboarding
            .removeDuplicates()
            .sink { [weak self] hasSeen in
                guard let self = self else { return }
                if hasSeen {
                    self.startCoordinator(MainCoordinator())
                } else {
                    self.startCoordinator(OnboardingCoordinator(hasSeenOnboarding: self.hasSeenOnboarding))
                }
            }
            .store(in: &subscriptions)
    }
    
    func setupOnboardingValue() {
        
        // storing and loading of state/data
        
        let key = "hasSeenOnboarding"
        let value = UserDefaults.standard.bool(forKey: key) //default of false
        hasSeenOnboarding.send(value)
        
        hasSeenOnboarding
            .filter({ $0 })
            .sink { (value) in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
        
    }
    
    
}

extension AppCoordinator {
    private func startCoordinator<C: RootViewControllerProvider>(_ coordinator: C) {
        coordinator.start()
        self.childCoordinators = [coordinator]
        self.window.rootViewController = coordinator.rootViewController as? UIViewController
    }
}

