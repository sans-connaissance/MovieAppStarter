//
//  FiltersViewModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/31/21.
//

import Foundation


class FiltersViewModel: ObservableObject {
    
    func filterMoviesByReleaseDate(releaseDate: Date) -> [MovieViewModel] {
        return Movie.byReleaseDate(releaseDate: releaseDate).map(MovieViewModel.init)
        
        
        
    }
    
}
