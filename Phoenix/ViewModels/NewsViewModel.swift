//
//  NewsListViewModel.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 10/5/2565 BE.
//

import Foundation
import CoreData

final class NewsViewModel: ObservableObject{
    @Published var username = ""
    
    private let repository: NewsRepositoryProtocol
    
    init(repository: NewsRepositoryProtocol = NewsRepository()){
        self.repository = repository
    }
    
    func onAppear() {
        repository.fetchNews{ response in
            self.username = response.msg_code
        }
    }
}
