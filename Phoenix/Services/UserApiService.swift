//
//  UserApiService.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 22/4/2565 BE.
//

import Foundation

protocol UserApiServiceProtocol {
    func fetchUser(completion: (User)->Void)
}

final class UserApiService: UserApiServiceProtocol{
    func fetchUser(completion: (User) -> Void) {
        completion(.init(username: "Tun"))
    }
}
