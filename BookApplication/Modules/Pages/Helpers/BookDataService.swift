//
//  BookDataService.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

final class BookDataService {
    static let shared = BookDataService()
    
    private let cacheKey = "cachedJSON"
    private let urlString = "https://run.mocky.io/v3/d403fba7-413f-40d8-bec2-afe6ef4e201e"
    
    func loadData() async -> Data? {
        if let savedData = UserDefaults.standard.data(forKey: cacheKey) {
            return savedData
        } else {
            return await fetchData()
        }
    }
    
    func fetchData() async -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard !data.isEmpty else { return nil }
            
            UserDefaults.standard.set(data, forKey: cacheKey)
            return data
            
        } catch {
            print("Network error: \(error.localizedDescription)")
            return nil
        }
    }
}
