//
//  MainTabView.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

struct MainTabView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.tundora)
    }
    
    var body: some View {
        TabView() {
            FirstPageView()
                .tabItem {
                    Label("First", systemImage: "doc.text")
                }

            SecondPageView()
                .tabItem {
                    Label("Second", systemImage: "book")
                }
        }
        .tint(.black)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .white
        }
    }
}

#Preview {
    MainTabView()
}
