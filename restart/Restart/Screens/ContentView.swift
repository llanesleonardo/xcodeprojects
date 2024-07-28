//
//  ContentView.swift
//  Restart
//
//  Created by Leonardo Llanes on 6/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
                OnBoardingView()
            } else{
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
