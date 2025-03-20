//
//  BookViewModel.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

final class BookViewModel: ObservableObject {
    @Published var pages: [BookItem] = []
    
    init() {
        Task {
            await loadData()
        }
    }
    
    private func loadData() async {
        if let data = await BookDataService.shared.loadData() {
            await decodeJSON(data)
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
