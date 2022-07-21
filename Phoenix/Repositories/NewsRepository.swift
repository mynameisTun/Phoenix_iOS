//
//  NewsListRepository.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 10/5/2565 BE.
//

import Foundation

protocol NewsRepositoryProtocol {
    func fetchNews(completion: (fetchNewsResponse)->Void)
}

final class NewsRepository: NewsRepositoryProtocol{

    private let apiService: NewsApiServiceProtocol
    
    init(apiService: NewsApiServiceProtocol = NewsApiService()){
        self.apiService = apiService
    }
    
    func fetchNews(completion: (fetchNewsResponse) -> Void) {
        apiService.fetchNews(completion: completion)
    }
}
