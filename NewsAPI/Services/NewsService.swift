//
//  NewsService.swift
//  NewsAPI
//
//  Created by pharuthapol on 25/6/2567 BE.
//

import Foundation
import Combine

class NewsService {
    private let apiKey = "0d2a24fcc92a47f1ad176e0aed50b567"
    private let baseUrl = "https://newsapi.org/v2/"
    
    func fetchNews(page: Int) -> AnyPublisher<[Article], Error> {
        guard let url = URL(string: "\(baseUrl)top-headlines?country=us&apiKey=\(apiKey)&page=\(page)") else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: NewsResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .eraseToAnyPublisher()
    }
}

