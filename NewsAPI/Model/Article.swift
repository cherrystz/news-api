//
//  Article.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import Foundation

struct Article: Codable, Identifiable {
    var id = UUID()
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

