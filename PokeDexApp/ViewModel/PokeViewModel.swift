//
//  PokeViewModel.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import Foundation

final class PokeViewModel {
    
    //MARK: - Properties
    
    var pokemonList: [PokeListData] = []
    
    var pokemonEvoArray: [PokeListData] = []
    
    
    //MARK: - Function to pass array to view
    
    func getPokemonList(completion: @escaping ([PokeListData]) -> ()) {
        NetworkManager.shared.fetchPokemonList { pokemon in
            self.pokemonList = pokemon
            completion(pokemon)
        }
    }
    
}
