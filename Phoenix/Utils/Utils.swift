//
//  Utils.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 18/5/2565 BE.
//

import Foundation
import SwiftUI

extension Data {
    func decodedObject<T: Decodable>() throws -> T {
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: self)
        return result
    }
}

class Util {
    static let util = Util()
    
    func loadImg(imageUrl:String) -> UIImage{
        do{
            guard let url = URL(string: imageUrl)
            else{
                return UIImage()
            }
            
            let data:Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        
        }catch{
            print(error)
            return UIImage()
        }
        
        return UIImage()
    }
    
    func currentDate() -> String{
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let dateString = df.string(from: date)
        
        return dateString
    }
    
    func callApi<T: Decodable>(method: String, header: [String: Any], bodyRequest:[String: Any], url: String, completion: @escaping (Result<T, Error>) -> Void){
        
        //convert request to json
        let jsonRequest = try? JSONSerialization.data(withJSONObject: bodyRequest)
        
        //prepare url, header, request
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue(header["contentType"] as! String, forHTTPHeaderField: "Content-Typev")
        request.addValue(header["clientId"] as! String, forHTTPHeaderField: "client_id")
        request.addValue(header["clientSecret"] as! String, forHTTPHeaderField: "client_secret")
        request.addValue(header["appMeta"] as! String, forHTTPHeaderField: "app-meta")
        request.httpBody = jsonRequest
        
        //call api
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            do {
                completion(.success(try data.decodedObject()))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}
