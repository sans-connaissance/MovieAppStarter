//
//  Movie+CoreDataProperties.swift
//  MovieApp
//
//  Created by David Malicke on 10/25/21.
//
//

import Foundation
import CoreData


extension Movie: BaseModel {
    
    
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }
    
    @NSManaged public var director: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var reviews: NSSet?
    @NSManaged public var actors: NSSet?
    
    static func byActorName(name: String) -> [Movie] {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "actors.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
}

// MARK: Generated accessors for reviews
extension Movie {
    
    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)
    
    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)
    
    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)
    
    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)
    
    @objc(addActorsObject:)
    @NSManaged public func addToActors(_ value: Actor)
    
}

extension Movie : Identifiable {
    
    
}
