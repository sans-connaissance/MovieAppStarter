//
//  CoreDataManager.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import Foundation
import CoreData
import SwiftUI

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
        
        let directories = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(directories[0])
        
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}
