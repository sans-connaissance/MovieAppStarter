//
//  Actor+CoreDataProperties.swift
//  MovieApp
//
//  Created by David Malicke on 10/30/21.
//
//

import Foundation
import CoreData


extension Actor: BaseModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Actor> {
        return NSFetchRequest<Actor>(entityName: "Actor")
    }

    @NSManaged public var name: String?
    @NSManaged public var movies: NSSet?
    
    
    static func getActorsByMovieId(movieId: NSManagedObjectID) -> [Actor] {
        guard let movie = Movie.byId(id: movieId) as? Movie,
              let actors = movie.actors
        else {
            return []
        }
        
        return (actors.allObjects as? [Actor]) ?? []
    }

}

// MARK: Generated accessors for movies
extension Actor {

    @objc(addMoviesObject:)
    @NSManaged public func addToMovies(_ value: Movie)

    @objc(removeMoviesObject:)
    @NSManaged public func removeFromMovies(_ value: Movie)

    @objc(addMovies:)
    @NSManaged public func addToMovies(_ values: NSSet)

    @objc(removeMovies:)
    @NSManaged public func removeFromMovies(_ values: NSSet)

}

extension Actor : Identifiable {
    


}
