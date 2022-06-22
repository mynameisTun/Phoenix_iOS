//
//  SearchNews.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 10/5/2565 BE.
//

import Foundation
import SwiftUI
import CoreData

struct SearchNewsView: View {
    @Binding var displayView: Bool
    
    let tagLabel = ["#เต่าบิน", "#Bitcoin", "#Crypto", "#เลือกตั้งกทม", "#น้ำมัน", "#ลุงตู่"]
    
    @State private var searchText: String = ""
    @State private var activeView: Bool = false
    
    var body: some View {
        VStack{
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.darkgray)
                    TextField("Search ..",text: $searchText)
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 15)
                        
                }
                .padding(10)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, maxHeight: 35)
                .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                        )
                
                Button(action: {
                    self.displayView.toggle()
                }) {
                    HStack {
                        Text("Cancel")
                            .font(.system(size: 15))
                            .foregroundColor(Color.blue)
                    }
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 25)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10){
                    ForEach(tagLabel, id:\.self) { item in
                        Button(action: {
                            self.searchText = item
                        }) {
                            HStack {
                                Text(item)
                                    .font(.system(size: 15))
                            }
                        }
                        .foregroundColor(Color.black)
                        .padding(10)
                        .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                )
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            
            Text("News")
                .padding(.horizontal)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView{
                VStack{
                    ForEach(0..<10) { i in
                        HStack{
                            Image("news")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(.trailing, 15)
                            
                            VStack{
                                Text("กลุ่มคอมพิวเตอร์ขึ้นราคาเนื่องจาก Bitcoin ราคาขึ้น")
                                    .padding(.bottom, 5)
                                    .font(.system(size: 15, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack{
                                    Text("4 May | 4 min read")
                                        .foregroundColor(.darkgray)
                                        .font(.system(size: 13))
                                    Spacer()
                                    Button(action: {}) {
                                        HStack {
                                            Image(systemName: "bookmark")
                                        }
                                    }
                                    .font(.system(size: 22))
                                    .foregroundColor(.darkgray)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    }
                }
            }
            
//            NavigationView {
//                List {
//                    ForEach(myFruits, id:\.self) { fruit in
//                        Text(fruit)
//                    }
//                }
//                .listStyle(GroupedListStyle())
//                .navigationTitle("MyFruits")
//            }
        }
        .padding(.top, 15)
        
    }
}

//struct SearchNewsView_Previews: PreviewProvider {
//    static var previews: some View {
////        SearchNewsView()
//    }
//}

