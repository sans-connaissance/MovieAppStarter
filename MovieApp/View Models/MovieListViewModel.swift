//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/22/21.
//

import Foundation
import CoreData


class MovieListViewModel: ObservableObject {
    
    func getAllMovies() {
        
        let movies = CoreDataManager.shared.getAllMovies()
    }
    
}


struct MovieViewModel {
    
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? ""
        
    }
    
    var releaseDate: String {
        return movie.releaseDate?.asFormattedString() ?? ""
    }
    
    var rating: Int? {
        
        return Int(movie.rating)
    }
    
}
