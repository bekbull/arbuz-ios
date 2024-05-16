//
//  OnboardingCoordinator.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import SwiftUI
import Combine

class OnboardingCoordinator: RootViewControllerProvider {
    
    var rootViewController = UIViewController()
    
    var hasSeenOnboarding: CurrentValueSubject<Bool, Never>
    
    init(hasSeenOnboarding: CurrentValueSubject<Bool, Never>) {
        self.hasSeenOnboarding = hasSeenOnboarding
    }
    
    func start() {
        let view = OnboardingView { [weak self] in
            self?.hasSeenOnboarding.send(true)
        }
        rootViewController = UIHostingController(rootView: view)
    }
}
