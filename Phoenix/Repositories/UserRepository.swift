//
//  UserRepository.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 22/4/2565 BE.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser(completion: (User)->Void)
}

final class UserRepository: UserRepositoryProtocol{
    
    private let apiService: UserApiServiceProtocol
    
    init(apiService: UserApiServiceProtocol = UserApiService()){
        self.apiService = apiService
    }
    
    func fetchUser(completion: (User) -> Void) {
        apiService.fetchUser(completion: completion)
    }
    
    
}
