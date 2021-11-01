//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/26/21.
//

import Foundation
import CoreData

enum SortDirection: CaseIterable {
    
    case ascending
    case descending
    
    var value: Bool {
        switch self {
        case .ascending:
            return true
        case .descending:
            return false
        }
    }
    
    var displayText: String {
        switch self {
        case .ascending:
            return "Ascending"
        case .descending:
            return "Descending"
        }
    }
}

enum SortOptions: String, CaseIterable {
    
    case title
    case releaseDate
    case rating
    
    var displayText: String {
        switch self {
        case .title:
            return "Title"
        case .releaseDate:
            return "Release Date"
        case .rating:
            return "Rating"
        }
    }
}

class MovieListViewModel: NSObject, ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    @Published var filterEnabled: Bool = false
    @Published var sortEnabled: Bool = false
    @Published var selectedSortOption: SortOptions = .title
    @Published var selectedSortDirection: SortDirection = .ascending
    
    func deleteMovie(movie: MovieViewModel) {
        let movie: Movie? = Movie.byId(id: movie.movieId)
        if let movie = movie {
            movie.delete()
        }
    }
    
    func sort() {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: selectedSortOption.rawValue, ascending: selectedSortDirection.value)]
        
        let fetchedResultsController: NSFetchedResultsController<Movie> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataManager.shared.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        
        //Example of multiple sort descriptors
//        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true), NSSortDescriptor(key: "rating", ascending: false)]
        
        try? fetchedResultsController.performFetch()
        
        DispatchQueue.main.async {
            self.movies = (fetchedResultsController.fetchedObjects ?? []).map(MovieViewModel.init)
        }
        
    }
    
    func getAllMovies() {
        DispatchQueue.main.async {
            self.movies = Movie.all().map(MovieViewModel.init)
        }
    }
}

struct MovieViewModel {
    
    let movie: Movie
    
    var movieId: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? "Not available"
    }
    
    var releaseDate: String? {
        return movie.releaseDate?.asFormattedString()
    }
    
    var rating: Int? {
        return Int(movie.rating)
    }
}
