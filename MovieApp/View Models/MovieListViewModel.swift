//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/22/21.
//

import Foundation
import CoreData


class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    
    func deleteMovie(movie: MovieViewModel) {
        
        // It's important to make this an optional -- otherwise there will be weird errors
        let movie: Movie? = Movie.byId(id: movie.id)
        if let movie = movie {
            movie.delete()
        }
    }
    
    func getAllMovies() {
        //Had to add type here in order to fix warning/error
        let movies: [Movie] = Movie.all()
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
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
        return movie.director ?? "Not available"
        
    }
    
    var releaseDate: String {
        return movie.releaseDate?.asFormattedString() ?? ""
    }
    
    var rating: Int? {
        
        return Int(movie.rating)
    }
    
}
