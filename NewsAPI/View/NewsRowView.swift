//
//  NewsRowView.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import SwiftUI

struct NewsRowView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                NewsImageView(url: url)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: imageUrl)
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.headline)
                Text(article.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}


