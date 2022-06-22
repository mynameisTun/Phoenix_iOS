//
//  Financial.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 8/6/2565 BE.
//
import Foundation
import SwiftUI
import CoreData

//extension String{
//    func load() -> UIImage{
//        do{
//            guard let url = URL(string: self)
//            else{
//                return UIImage()
//            }
//
//            let data:Data = try Data(contentsOf: url)
//
//            return UIImage(data: data) ?? UIImage()
//
//        }catch{
//
//        }
//
//        return UIImage()
//    }
//}

struct FinancialView: View {
    
    @State var selection: Int? = nil
    var body: some View {
        NavigationView{
            VStack{
                if #available(iOS 15.0, *) {
                    AsyncImage(url: URL(string: "https://content.talpha.co/payroll/imagemap_retirement.png"))
                } else {
//                    Image(uiImage: "https://content.talpha.co/payroll/imagemap_retirement.png".load())
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
        
        
        
    }
}

struct FinancialView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialView()
    }
}
