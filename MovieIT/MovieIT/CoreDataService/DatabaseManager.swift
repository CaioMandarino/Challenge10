//
//  DatabaseManager.swift
//  MovieIT
//
//  Created by Caio Mandarino on 10/11/25.
//

import Foundation
import CoreData

final class DatabaseManager {
    let persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext { persistentContainer.viewContext }
    
    init(containerName: String = "Database") {
        persistentContainer = NSPersistentContainer(name: containerName)
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    
    func add<T: NSManagedObject>(_ object: T) throws {
        context.insert(object)
        try saveContext()
    }
    
    func getElements<T: NSManagedObject>(filter predicate: NSPredicate? = nil) throws -> [T] {
        
        guard let request: NSFetchRequest<T> = T.fetchRequest() as? NSFetchRequest<T> else {
            return []
        }
        
        request.predicate = predicate
                
        let elements = try context.fetch(request)
        
        return elements
    }
    
    private func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
}

