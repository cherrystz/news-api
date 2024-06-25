//
//  NewsListView.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject private var viewModel = NewsListViewModel()
    @State private var isShowingErrorAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar
                
                List(viewModel.filteredArticles) { article in
                    NavigationLink(destination: NewsDetailView(viewModel: NewsDetailViewModel(article: article))) {
                        NewsRowView(article: article)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("News")
                .overlay(
                    Group {
                        if viewModel.isLoading {
                            NewsProgressView()
                        }
                    }
                )
                .alert(isPresented: $isShowingErrorAlert) {
                    Alert(title: Text("Error"), message: Text(viewModel.error?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("OK")))
                }
            }
        }
        .onAppear {
            viewModel.fetchNews()
        }
    }
    
    private var searchBar: some View {
        HStack {
            TextField("Search News", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {
                // Clear text field
                viewModel.searchText = ""
                viewModel.filterArticles(with: "")
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(UIColor.opaqueSeparator))
                    .padding(.trailing, 8)
            }
        }
    }
}
