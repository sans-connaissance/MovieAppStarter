//
//  ReviewListViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/2/21.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByMovie(vm: MovieViewModel) {
        let movie = CoreDataManager.shared.getMovieById(id: vm.id)
        if let movie = movie {
            DispatchQueue.main.async {
                
            }
        }
        
    }
   
    
}

struct ReviewViewModel {
    
    
    
}
