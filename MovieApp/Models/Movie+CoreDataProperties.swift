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
    
    static func byReleaseDate(releaseDate: Date) -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@", #keyPath(Movie.releaseDate), releaseDate as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
        
    }

    // keyPath is cool. It assigns that value to the %K placeholder.
    // and %@ is a placeholder for the functions parameter
    static func byDateRange(lower: Date, upper: Date) -> [Movie] {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@", #keyPath(Movie.releaseDate),lower as NSDate,#keyPath(Movie.releaseDate),upper as NSDate)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
    }
    
    static func byDateRangeOrMinimumRating(lower: Date?,  upper: Date?, minimumRating: Int?) -> [Movie] {
        
        var predicates: [NSPredicate] = []
        
        if let lower = lower, let upper = upper {
            let dateRangePredicate = NSPredicate(format: "%K >= %@ AND %K <= %@", #keyPath(Movie.releaseDate),lower as NSDate,#keyPath(Movie.releaseDate),upper as NSDate)
            
            predicates.append(dateRangePredicate)
            
        } else if let minRating = minimumRating {
            let minRatingPredicate = NSPredicate(format: "%K >= %i", #keyPath(Movie.rating), minRating)
            predicates.append(minRatingPredicate)
        }
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
        
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
