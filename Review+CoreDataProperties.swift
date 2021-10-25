//
//  Review+CoreDataProperties.swift
//  MovieApp
//
//  Created by David Malicke on 10/25/21.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var publishedAt: Date?
    @NSManaged public var movie: Movie?

}

extension Review : Identifiable {

}
