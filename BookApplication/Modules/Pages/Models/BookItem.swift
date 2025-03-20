//
//  BookItem.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

struct BookItem: Codable, Identifiable {
    let id = UUID()
    let type: String
    let title: String?
    let src: String?
    let items: [BookItem]?
    
    enum CodingKeys: String, CodingKey {
        case type, title, src, items
    }
}
