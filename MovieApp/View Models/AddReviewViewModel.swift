//
//  AddReviewViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/2/21.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    
    var title: String = ""
    var body: String = ""
    
    func addReviewForMovie(vm: MovieViewModel) {
        
        let movie = CoreDataManager.shared.getMovieById(id: vm.id)
        
        let review = Review(context: CoreDataManager.shared.viewContext)
        
        review.title = title
        review.body = body
        review.movie = movie
        
        CoreDataManager.shared.save()
        
        
    }
    
}
