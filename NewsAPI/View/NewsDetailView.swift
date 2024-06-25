//
//  NewsDetailView.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import SwiftUI

struct NewsDetailView: View {
    @ObservedObject var viewModel: NewsDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = viewModel.article.urlToImage, let url = URL(string: imageUrl) {
                    NewsImageView(url: url)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .clipped()
                }
                Text(viewModel.article.title)
                    .font(.largeTitle)
                    .bold()
                Text(viewModel.article.description ?? "")
                    .font(.body)
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Detail", displayMode: .inline)
    }
}

