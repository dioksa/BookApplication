//
//  BookApplicationApp.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

@main
struct BookApplicationApp: App {
    @State private var isSplashScreenShown = true
    
    private enum Constants {
        static let loadingDuration: TimeInterval = 6.0
    }
    
    var body: some Scene {
        WindowGroup {
            if isSplashScreenShown {
                StartLoadingView()
                    .task {
                        try? await Task.sleep(for: .seconds(Constants.loadingDuration))
                        isSplashScreenShown.toggle()
                    }
            } else {
                ContentView()
            }
        }
    }
}
