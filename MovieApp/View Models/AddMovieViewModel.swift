//
//  AddMovieViewModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/21/21.
//

import Foundation

class AddMovieViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var director: String = ""
   @Published var rating: Int? = nil
    @Published var releaseDate: Date = Date()
    
    func save() {
        
        let movie = Movie(context: Movie.viewContext)
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        
        movie.save()
        
        
    }
    
}
