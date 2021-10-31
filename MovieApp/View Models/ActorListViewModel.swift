//
//  ActorListViewModel.swift
//  MovieApp
//
//  Created by David Malicke on 10/30/21.
//

import Foundation
import CoreData


class ActorListViewModel: ObservableObject {
    
   @Published var actors = [ActorViewModel]()
    
    func getActorsByMovie(vm: MovieViewModel) {
        
        
    }
    
}


struct ActorViewModel {
    
    let actor: Actor
    
    var actorId: NSManagedObjectID {
        return actor.objectID
    }
    
    var name: String {
        return actor.name ?? ""
    }
    
}
