//
//  CoreDataMenager.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 13/6/2565 BE.
//

import Foundation
import CoreData


class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let share = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func deleteStock(stock: Stock) {

        viewContext.delete(stock)
        save()

    }
    
    func deleteNews(news: News) {

        viewContext.delete(news)
        save()

    }
    
    func deleteNoti(notification: Notification) {

        viewContext.delete(notification)
        save()

    }
//
//    func getAllTasks() -> [Task] {
//
//        let request: NSFetchRequest<Task> = Task.fetchRequest()
//
//        do {
//            return try viewContext.fetch(request)
//        } catch {
//            return []
//        }
//
//    }
//
//    func getTaskById(id: NSManagedObjectID) -> Task? {
//
//        do {
//            return try viewContext.existingObject(with: id) as? Task
//        } catch {
//            return nil
//        }
//
//    }

    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Phoenix")
        persistentContainer.loadPersistentStores{ (description, error) in
            if let error = error {
                fatalError("Unable to initialize core data stack \(error)")
            }
        }
    }
}
