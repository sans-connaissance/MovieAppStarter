//
//  AddReviewViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/2/21.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var body: String = ""
    
    func addReviewForMovie(vm: MovieViewModel) {
        
        let movie: Movie? = Movie.byId(id: vm.movieId)
        
        if let movie = movie {
            let review = Review(context: Review.viewContext)
            
            review.title = title
            review.body = body
            review.movie = movie
            review.save()
            
        }
        
    }
    
}
