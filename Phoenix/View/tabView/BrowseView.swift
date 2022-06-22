//
//  HomeView.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 5/5/2565 BE.
//

import Foundation
import SwiftUI
import CoreData


struct BrowseView: View {
    
    @State private var scrollViewContentSize: CGSize = .zero
    @State var selection: Int? = nil
    
    @State private var searchText: String = ""
    let tagLabel = ["Watchlist", "Trending", "Top Gainer", "Top Loser"]
    
    func randomData() -> [CGFloat] {
        var randomData: [CGFloat] = []
        
        for _ in 1...20{
            var tmp = CGFloat.random(in: 100...1000)
            randomData.append(tmp)
        }
        return randomData
    }
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                
                VStack(spacing: 10){
                    HStack(){
                        Text("ค้นหา")
                            .font(.system(size: 25))
                        Spacer()
                        
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 30)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.darkgray)
                            .padding(10)
                        TextField("Search for companies",text: $searchText)
                            .font(.system(size: 15))
                            .frame(maxWidth: .infinity, maxHeight: 43)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 43)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                            .padding(.horizontal)
                    )
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            ForEach(tagLabel, id:\.self) { item in
                                Button(action: {
                                    self.searchText = item
                                }) {
                                    HStack {
                                        Text(item)
                                            .font(.system(size: 13))
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
                    
                    VStack(spacing: 15){
                        ForEach(0..<4) { i in
                            HStack{
                                Image("notiLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .padding([.leading,.trailing], 10)
                                
                                VStack(spacing: 3){
                                    Text("ADVANCE")
                                        .font(.system(size: 13))
                                    Text("AIS")
                                        .font(.system(size: 13))
                                }
                                Spacer()
                                
                                LineChartView(data: randomData(),frameWidth: 70, frameheight: 20, lineColor: .plusgreen)
                                Spacer()
                                
                                VStack(spacing: 3){
                                    Text("100")
                                        .font(.system(size: 13))
                                    Text("+5.98%")
                                        .font(.system(size: 13))
                                        .foregroundColor(.plusgreen)
                                }
                                .padding(.trailing,15)
                            }
                            Rectangle()
                                .fill(Color.gray.opacity(0.7))
                                .frame(maxWidth: .infinity, maxHeight: 1, alignment: .center)
                                .padding(.horizontal)
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                            .padding(.horizontal)
                    )
                    
                    Button(action: {}) {
                        HStack {
                                Text("See All")
                                .font(.system(size: 15))
                                .foregroundColor(Color.blue)
                        }
                    }
                    .padding(.top,20)
                    
                    Text("หมวดอุตสาหกรรม")
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: FoodIndustryView(), tag: 1, selection: $selection) {
                                Button(action: {self.selection = 1}) {
                                    VStack{
                                        Image("catagoryFood")
                                            .resizable()
                                            .padding(15)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.darkgray)
                                            .background(Color.gray.opacity(0.1))
                                            .cornerRadius(32)
                                        Spacer()
                                        
                                        Text("Agro & Food Industry")
                                            .font(.system(size: 13))
                                            .foregroundColor(.black)
                                            .frame(maxWidth: 100, maxHeight: 32)
                                            .multilineTextAlignment(.center)
                                        Text("30 Stock")
                                            .font(.system(size: 10))
                                            .foregroundColor(.lightgray)
                                            .frame(maxWidth: 100, maxHeight: 15)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                        
                                        Text("+0.44%")
                                            .font(.system(size: 10))
                                            .foregroundColor(.plusgreen)
                                            .frame(maxWidth: 100, maxHeight: 15)
                                            .multilineTextAlignment(.center)
                                    }
                                    .padding([.top,.bottom],7)
                                    .frame(maxWidth: 140, maxHeight: 150)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                            .padding(.horizontal)
                                    )
                                }
                            }
                            .navigationBarHidden(true)
                            
                            Button(action: {}) {
                                VStack{
                                    Image("catagoryCustomerProduct")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()
                                    
                                    Text("Consumer Products")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                    
                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(maxWidth: 140, maxHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                            NavigationLink(destination: FinancialView(), tag: 1, selection: $selection) {
                            Button(action: {self.selection = 1}) {
                                VStack{
                                    Image("catagoryFinance")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()
                                    
                                    Text("Financials")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                    
                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(maxWidth: 140, maxHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                            }
                            .navigationBarHidden(true)
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 150, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        HStack{
                            Button(action: {}) {
                                VStack{
                                    Image("catagoryIndustrial")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()

                                    Text("Industrials")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()

                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(maxWidth: 140, maxHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                            Button(action: {}) {
                                VStack{
                                    Image("catagoryConstruction")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()

                                    Text("Property & Construction")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()

                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(maxWidth: 140, maxHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                            Button(action: {}) {
                                VStack{
                                    Image("catagoryResource")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()

                                    Text("Resources")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()

                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(maxWidth: 140, maxHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 150, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        HStack{
                            Button(action: {}) {
                                VStack{
                                    Image("catagoryService")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()

                                    Text("Services")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()

                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(minWidth: 138, idealWidth: 140, minHeight: 150, idealHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                            Button(action: {}) {
                                VStack{
                                    Image("catagoryTech")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding(15)
                                        .foregroundColor(.darkgray)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(32)
                                    Spacer()

                                    Text("Technology")
                                        .font(.system(size: 13))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: 100, maxHeight: 32)
                                        .multilineTextAlignment(.center)
                                    Text("30 Stock")
                                        .font(.system(size: 10))
                                        .foregroundColor(.lightgray)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                    Spacer()

                                    Text("+0.44%")
                                        .font(.system(size: 10))
                                        .foregroundColor(.plusgreen)
                                        .frame(maxWidth: 100, maxHeight: 15)
                                        .multilineTextAlignment(.center)
                                }
                                .padding([.top,.bottom],7)
                                .frame(minWidth: 138, idealWidth: 140, minHeight: 150, idealHeight: 150)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 2)
                                        .padding(.horizontal)
                                )
                            }
                        }
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 150, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    }
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 480, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            }
            .navigationBarHidden(true)
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}


