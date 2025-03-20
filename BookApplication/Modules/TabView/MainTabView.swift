//
//  MainTabView.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

struct MainTabView: View {
    @StateObject private var viewModel = BookViewModel()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(.tundora)
    }
    
    var body: some View {
        TabView {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .chenin))
            } else {
                ForEach(viewModel.pages) { page in
                    NavigationView {
                        EachItemView(item: page)
                            .navigationTitle(page.title ?? "Page")
                            .navigationBarTitleDisplayMode(.large)
                    }
                    .tabItem {
                        Label(page.title ?? "Page", systemImage: tabIcon(for: page.title))
                    }
                }
            }
        }
        
        .tint(Color.gallery)
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = .black
        }
        
        .refreshable {
            await viewModel.loadData()
        }
    }
    
    private func tabIcon(for title: String?) -> String {
        switch title {
        case "Main Page": return "doc.text"
        case "Second Page": return "book"
        default: return "doc"
        }
    }
}

#Preview {
    MainTabView()
}
