//
//  NewsDetailViewModel.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import Foundation
import Combine

class NewsDetailViewModel: ObservableObject {
    @Published var article: Article
    
    init(article: Article) {
        self.article = article
    }
}

