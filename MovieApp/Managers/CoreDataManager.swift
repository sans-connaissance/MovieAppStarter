//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    let containerPath = Bundle.main.path(forResource: "MoveAppModel", ofType: "sqlite")
    
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "MoveAppModel")
//        persistentContainer.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: containerPath ?? "/dev/null")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
    }
    
    func getAllMovies() -> [Movie] {
        let fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
            
        } catch {
            
            return []
        }
        
        
    }
    
    func save() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save a movie \(error)")
        }
        
    }

}
