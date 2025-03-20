//
//  BookItemView.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

struct BookItemView: View {
    let item: BookItem
    
    var body: some View {
        switch item.type {
        case "text":
            Text(item.title ?? "")
                .font(FontStyle.medium.font(size: .h18))
                .foregroundStyle(Color.azureRadiance)
        case "image":
            if let urlString = item.src, let url = URL(string: urlString) {
                NavigationLink(destination: ImageDetailsView(imageURL: url, title: item.title ?? "")) {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit().frame(height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
        case "section":
            Section(header: Text(item.title ?? "")) {
                ForEach(item.items ?? []) { subItem in
                    BookItemView(item: subItem)
                }
            }
            .font(FontStyle.bold.font(size: .h20))
            .foregroundStyle(Color.chenin)
        default:
            EmptyView()
        }
    }
}
