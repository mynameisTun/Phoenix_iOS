//
//  SearchNews.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 10/5/2565 BE.
//

import Foundation
import SwiftUI
import CoreData

struct NotificationView: View {
    @Binding var displayView: Bool
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 10){
                Text("Notification")
                    .font(.system(size: 25))
                    .foregroundColor(.black)
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "gearshape")
                    }
                }
                .padding(7)
                .font(.system(size: 27))
                .foregroundColor(.darkgray)
                
                ZStack{
                    Button(action: {
                        self.displayView.toggle()
                    }) {
                        HStack {
                            Image(systemName: "xmark")
                        }
                    }                    .padding(5)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(32)
                    
                }
            }
            .padding(.horizontal)
            
            
            
            VStack(spacing: 10){
                ScrollView{
                    Text("Lasted 24 Hours")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    ForEach(0..<10) { i in
                        HStack(spacing: 30){
                            ZStack{
                                Image("notiLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 10)
                                
                                Image(systemName: "arrow.up")
                                    .font(.system(size: 10))
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.white)
                                    .background(Color.plusgreen)
                                    .cornerRadius(50)
                                    .offset(x: 17.0,
                                            y: 15.0)
                            }
                            
                            VStack{
                                Text("Watchlist | 10 min ago")
                                    .foregroundColor(.darkgray)
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("ADVANCE is up +5.23% to 4000")
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                            .padding(.horizontal)
                        
                    }
                    
                    Text("Older")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    ForEach(0..<10) { i in
                        HStack(spacing: 30){
                            ZStack{
                                Image("notiLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading, 10)
                                
                                Image(systemName: "arrow.down")
                                    .font(.system(size: 10))
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(50)
                                    .offset(x: 17.0,
                                            y: 15.0)
                            }
                            VStack{
                                Text("Watchlist | 10 min ago")
                                    .foregroundColor(.darkgray)
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("ADVANCE is up +5.23% to 4000")
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

//struct Notification_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NotificationView()
//        }
//    }
//}
