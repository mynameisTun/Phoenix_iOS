//
//  NewsListApiService.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 10/5/2565 BE.
//

import Foundation

protocol NewsApiServiceProtocol {
    func fetchNews(completion: (fetchNewsResponse)->Void)
}

final class NewsApiService: NewsApiServiceProtocol{
    private var util = Util()
    
    let header: [String: Any]
    
    init() {
        let now = util.currentDate()
        self.header = [
            "contentType": "application/json",
            "clientId": clientId,
            "clientSecret": clientSecret,
            "appMeta": "{'user_id':'"+userId+"', 'user_name':'"+username+"','log_session_id':'"+UUID().uuidString+"','request_datetime':'"+now+"','sub_state':'"+state+"'}"
        ]
    }
    
    
    func fetchNews(completion: (fetchNewsResponse) -> Void) {
        let bodyRequest:[String: Any] = [
            "contentType": "application/json",
            "clientId": "f46816e9b43e4b4fbacd9f303c654275",
            "clientSecret": "8307C48f3C6c40198AcD75E3558a204F",
            "appMeta": "{'user_id':'fa269edf-41a2-4762-99ba-967bbb8fd552', 'user_name':'1156alphasvc@tisco.co.th','log_session_id':'phoenix_service','request_datetime':'1567407806000','sub_state':''}"
        ]
        let stringUrl = tiscoApi+"phoenix-v1-service/testservice"
        
        util.callApi(method: "post", header: self.header, bodyRequest: bodyRequest, url: stringUrl){ (result: Result<fetchNewsResponse, Error>) in
            switch result {
            case let .success(example):
                print(example.msg_code)
            case let .failure(error):
                print(error)

            }
        }
        
        
//        completion(.init(username: "Tun"))
    }
}
