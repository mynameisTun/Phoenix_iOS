//
//  PhoenixApp.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 22/4/2565 BE.
//

import SwiftUI

@main
struct PhoenixApp: App {
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var addData: AppDataModel
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .environmentObject(addData)
//                .onOpenURL { url in
//                    print(url)
//                }
        }
    }
}
