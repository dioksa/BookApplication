//
//  ImageDetailsView.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//
import SwiftUI

struct ImageDetailsView: View {
    let imageURL: URL
    let title: String
    
    var body: some View {
        VStack {
            AsyncImage(url: imageURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
