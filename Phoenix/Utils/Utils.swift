//
//  Utils.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 18/5/2565 BE.
//

import Foundation
import SwiftUI


//extension Array where Element == CGfloat {
//    
//    var normalized: [CGfloat]{
//        if let min = self.min(), let max = self.max(){
//            return self.map{ ($0-min)/(min-max)}
//        }
//        return[]
//    }
//}

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
}
