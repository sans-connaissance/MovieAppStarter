//
//  Movie+CoreDataProperties.swift
//  MovieApp
//
//  Created by David Malicke on 10/21/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseDate: Date?

}

extension Movie : Identifiable {

}
