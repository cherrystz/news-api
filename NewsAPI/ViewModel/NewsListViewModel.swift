//
//  NewsListViewModel.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import Foundation
import Combine

class NewsListViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var filteredArticles: [Article] = []
    @Published var isLoading = false
    @Published var error: Error?
    @Published var searchText: String = ""
    
    private var newsService = NewsService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSearchTextObserver()
    }
    
    func fetchNews(page: Int = 1) {
        isLoading = true
        
        newsService.fetchNews(page: page)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                if case let .failure(error) = completion {
                    self.error = error
                }
            } receiveValue: { newArticles in
                let newUniqueArticles = newArticles.filter { newArticle in
                    !self.articles.contains { $0.id == newArticle.id }
                }
                self.articles.append(contentsOf: newUniqueArticles)
                self.filteredArticles = self.articles
            }
            .store(in: &cancellables)
    }
    
    func filterArticles(with query: String) {
        if query.isEmpty {
            filteredArticles = articles
        } else {
            filteredArticles = articles.filter { $0.title.lowercased().contains(query.lowercased()) }
        }
    }
    
    private func setupSearchTextObserver() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] newValue in
                self?.filterArticles(with: newValue)
            }
            .store(in: &cancellables)
    }
}
