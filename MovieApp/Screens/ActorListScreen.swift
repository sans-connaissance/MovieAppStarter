//
//  ActorListScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/11/21.
//

import SwiftUI

struct ActorListScreen: View {
    
    @State private var isPresented: Bool = false
    let movie: MovieViewModel
    
    @StateObject private var actorListVM = ActorListViewModel()
    
    var body: some View {
           
            List {
            
                Section(header: Text("Actors")) {
                    ForEach(actorListVM.actors, id: \.actorId) { index in
                        
                        HStack {
                            NavigationLink(
                                destination: ActorDetailsScreen(actor: index),
                                label: {
                                    Text(index.name)
                                        .foregroundColor(.black)
                                })
                            Spacer()
                        }
                        .padding(10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9567790627, green: 0.9569163918, blue: 0.9567491412, alpha: 1)), Color(#colorLiteral(red: 0.9685427547, green: 0.9686816335, blue: 0.9685124755, alpha: 1))]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                    }
                }
            
            }.listStyle(PlainListStyle())
            
        
        .onAppear(perform: {
            actorListVM.getActorsByMovie(vm: movie)
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            actorListVM.getActorsByMovie(vm: movie)
            
        }, content: {
            AddActorScreen(movie: movie)
        })
        .navigationTitle(movie.title)
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))

    }
}

struct ActorListScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let movie = Movie(context: CoreDataManager.shared.viewContext)
        movie.title = "Lord of the Rings"
        let actor = Actor(context: CoreDataManager.shared.viewContext)
        actor.name = "Tom Hanks"
        movie.addToActors(actor)
        
        return ActorListScreen(movie: MovieViewModel(movie: movie))
            .embedInNavigationView()
        
        
        
    }
}
