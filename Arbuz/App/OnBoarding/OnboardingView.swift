//
//  OnboardingView.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 16.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    var doneRequested: () -> ()
    
    var body: some View {
        Text("Being Onboarded")
        Button("Done") {
            doneRequested()
        }
    }
}
