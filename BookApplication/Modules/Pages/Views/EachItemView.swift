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
                BookItemView(item: subItem)
            }
        }
    }
}
