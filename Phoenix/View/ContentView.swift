//
//  ContentView.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 22/4/2565 BE.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel = UserProfileViewModel()
    @State private var selectedTab = "1"
    
        
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem(){
                    Image(systemName:"house")
                    Text("Home")
                }
                .tag("1")
            BrowseView()
                .tabItem(){
                    Image(systemName:"magnifyingglass")
                    Text("Browse")
                }
                .tag("2")
            PortfolioView()
                .tabItem(){
                    Image(systemName:"chart.pie")
                    Text("Portfolio")
                }
                .tag("3")
            TradeView()
                .tabItem(){
                    Image(systemName:"arrow.left.arrow.right")
                    Text("Trade")
                }
                .tag("4")
            ProfileView()
                .tabItem(){
                    Image(systemName:"person.crop.circle.fill")
                    Text("Profile")
                }
                .tag("5")
        }
        
    }
    
}

extension Color {
    static let darkgray = Color("darkgray")
    static let tiscoblue = Color("tiscoblue")
    static let plusgreen = Color("plusgreen")
    static let lightgray = Color("lightgray")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        ContentView()
    }
}
