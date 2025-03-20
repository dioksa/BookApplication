//
//  EachItemView.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

struct EachItemView: View {
    let item: BookItem
    
    var body: some View {
        List {
            ForEach(item.items ?? []) { subItem in
                SectionView(item: subItem)
            }
        }
    }
}

struct SectionView: View {
    let item: BookItem
    
    var body: some View {
        if item.type == "section" {
            Section(header: Text(item.title ?? "")) {
                ForEach(item.items ?? []) { subItem in
                    BookItemView(item: subItem)
                }
            }
            .font(FontStyle.regular.font(size: .h24))
            .foregroundStyle(Color.keppel)
        }
    }
}
