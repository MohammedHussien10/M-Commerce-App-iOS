//
//  CoreDataManager.swift
//  Shopify-IOS
//
//  Created by Macos on 13/06/2025.
//

import Foundation
import CoreData
// MARK: - CoreDataManager
class CoreDataManager{
    // MARK: - Singleton Instance
    static let shared = CoreDataManager()
    // MARK: - Core Data Stack
    let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
           persistentContainer.viewContext
       }
    // MARK: - Initialization
    private init() {
        persistentContainer = NSPersistentContainer(name: "AddressModel")
        persistentContainer.loadPersistentStores{
            description, error in
                        if let error = error {
                            fatalError("dataBase Error \(error)")
                        }
        }
    }
    // MARK: - Save Context
    func saveContext() {
         if context.hasChanges {
             do {
                 try context.save()
             } catch {
                 print("saving Error context \(error)")
             }
         }
     }
    
    // MARK: - Create Entity
    
    func create<T: NSManagedObject>(entity: T.Type) -> T {
           return T(context: context)
       }
    
    // MARK: - Fetch Entities
    
    func fetch<T: NSManagedObject>(entity: T.Type,
                                     predicate: NSPredicate? = nil,
                                     sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
          let request = NSFetchRequest<T>(entityName: String(describing: T.self))
          request.predicate = predicate
          request.sortDescriptors = sortDescriptors

          do {
              return try context.fetch(request)
          } catch {
              print("Error fetching data\(T.self): \(error)")
              return []
          }
      }
    // MARK: - Delete Single Object
    
    func delete<T: NSManagedObject>(_ object: T) {
            context.delete(object)
            saveContext()
        }
    
    // MARK: - Delete All of Entity

        func deleteAll<T: NSManagedObject>(entity: T.Type) {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
            let batchDelete = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try context.execute(batchDelete)
                saveContext()
            } catch {
                print("Error deleting all \(T.self): \(error)")
            }
        }
}
