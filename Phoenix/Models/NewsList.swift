//
//  NewsList.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 9/5/2565 BE.
//

import Foundation

//struct NewsList {
//    var topic: String
//    var imageUrl: String
//    var stockRelateList: [stock]
//    var createDate: String
//    var bookmark: Bool
//    var timeToRead: Int
//}
//
//struct stock: Codable {
//    var stockName: String
//    var upTrend: Bool
//    var downTrend: Bool
//    var percentage: Float
//}

struct fetchNewsResponse: Decodable {
    var msg_code: String
    var msg_detail: String
    var response_data: [String]
}
