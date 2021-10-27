//
//  Review+CoreDataProperties.swift
//  MovieApp
//
//  Created by David Malicke on 10/25/21.
//
//

import Foundation
import CoreData


extension Review: BaseModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }
    
    static func getReviewsByMovieId(movieId: NSManagedObjectID) -> [Review] {
        
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %@", movieId)
        
        do {
            return try CoreDataManager.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var movie: Movie?

}

extension Review : Identifiable {

}
