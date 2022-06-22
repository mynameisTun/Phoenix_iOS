//
//  UserProfileViewModel.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 22/4/2565 BE.
//

import Foundation

final class UserProfileViewModel: ObservableObject{
    @Published var username = ""
    
    private let repository: UserRepositoryProtocol
    
    init(repository: UserRepositoryProtocol = UserRepository()){
        self.repository = repository
    }
    
    func onAppear() {
        repository.fetchUser{ user in
            self.username = user.username
        }
    }
}
