//
//  BaseModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/26/21.
//

import Foundation
import CoreData

protocol BaseModel where Self: NSManagedObject {
    
    func save()
    
    func delete()
    
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?
    static func all<T: NSManagedObject>() -> [T]
    
}

extension BaseModel {
    
    static var viewContext: NSManagedObjectContext {
        return CoreDataManager.shared.viewContext
    }
    
    func save() {
        do {
          try  Self.viewContext.save()
        } catch {
            Self.viewContext.rollback()
            print(error)
        }
        
    }
    
    func delete() {
        Self.viewContext.delete(self)
        save()
    }
    
    static func all<T>() -> [T] where T: NSManagedObject {
        
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    // THIS IS SO COOL!!!!
    static func byId<T>(id: NSManagedObjectID) -> T? where T: NSManagedObject {
        
        do {
            return try viewContext.existingObject(with: id) as? T
        } catch {
            print(error)
            return nil
        }
    }
    
}

