//
//  HomeView.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 5/5/2565 BE.
//

import Foundation
import SwiftUI
import Combine
import CoreData


struct HomeView: View {
    @State private var searchNewsViewActive = false
    @State private var notificationViewActive = false
//    @Binding var searchNewsViewActive: Bool
    
    @StateObject private var newsModel = NewsViewModel()
    
    var body: some View {
        
        VStack(spacing: 0){
            // header
            HStack(spacing: 10){
                Image("tiscoLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 55)
                Spacer()
                
                Button(action: {
                    searchNewsViewActive.toggle()
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                    }
                }
                .sheet(isPresented: $searchNewsViewActive) {
                    SearchNewsView(displayView: self.$searchNewsViewActive)
                }
                .padding(7)
                .font(.system(size: 25))
                .foregroundColor(.darkgray)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(32)
                
                ZStack{
                    Button(action: {
                        self.notificationViewActive.toggle()
                    }) {
                        HStack {
                            Image(systemName: "bell")
                        }
                    }
                    .sheet(isPresented: $notificationViewActive) {
                        NotificationView(displayView: self.$notificationViewActive)
                    }
                    .padding(7)
                    .font(.system(size: 25))
                    .foregroundColor(.darkgray)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(32)
                    
                    Text("3")
                        .font(.system(size: 13))
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(50)
                        .offset(x: 13.0,
                                y: -17.0)
                    
                }
            }
            .padding(.horizontal)
            
            Text("ข่าวแนะนำสำหรับคุณ")
                .font(.custom("TISCO_AD-Regular", size: 25))
//                .font(.system(size: 25))
                .foregroundColor(.tiscoblue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView {
                VStack() {
                    VStack{
                        Image("topNews")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)

                        Text("คาดการครึ่งปีหลัง64 หุ้นธนาคารแข็งตัวอย่างมากต้อนรับการเปิดเมือง")
                            .padding(.bottom, 5)
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack{
                            Image(systemName: "arrowtriangle.up.fill")
                                .font(.system(size: 13))
                            Text("TISCO +1.22%")
                                .font(.system(size: 13, weight: .bold))

                            Image(systemName: "arrowtriangle.up.fill")
                                .font(.system(size: 13))
                            Text("BAY +3.6%")
                                .font(.system(size: 13, weight: .bold))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.plusgreen)

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
                        .padding(.top, 3)

                    }
                    .padding(.horizontal)

                    Rectangle()
                        .fill(Color.gray.opacity(0.7))
                        .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                        .padding(.horizontal)
                    
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
                                    .font(.system(size: 20, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack{
                                    Image(systemName: "arrowtriangle.up.fill")
                                        .font(.system(size: 13))
                                    Text("ADVICE +0.55%")
                                        .font(.system(size: 13, weight: .bold))
                                        
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.plusgreen)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
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
                        .padding(.horizontal)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: 0.5, alignment: .center)
                            .padding(.horizontal)
                    }
                }
                
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .onAppear{
            newsModel.onAppear()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
