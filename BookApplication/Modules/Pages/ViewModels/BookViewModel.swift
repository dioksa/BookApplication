//
//  BookViewModel.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

final class BookViewModel: ObservableObject {
    @Published var pages: [BookItem] = []
    @Published var isLoading = true
    
    init() {
        Task {
            await loadData()
        }
    }
    
    func loadData() async {
        await MainActor.run {
            isLoading = true
        }
                
        if let data = await BookDataService.shared.loadData() {
            await decodeJSON(data)
        }
        
        await MainActor.run {
            isLoading = false
        }
    }

    @MainActor
    private func decodeJSON(_ data: Data) {
        do {
            let decodedData = try JSONDecoder().decode(BookItem.self, from: data)
            DispatchQueue.main.async {
                self.pages = [decodedData] + (decodedData.items?.filter { $0.type == "page" } ?? [])
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
