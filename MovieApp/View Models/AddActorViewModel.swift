//
//  AddActorViewModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/30/21.
//

import Foundation
import CoreData

class AddActorViewModel: ObservableObject {
    
    @Published var name: String = ""
    
    func addActorToMovie(movieId: NSManagedObjectID) {
        
        let movie: Movie? = Movie.byId(id: movieId)
        
        if let movie = movie {
            let actor = Actor(context: Actor.viewContext)
            actor.name = name
            actor.addToMovies(movie)
            
            actor.save()
        }
        
    }
    
}

