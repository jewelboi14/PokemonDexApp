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
    
    func getEvoChain(at row: Int) {
            pokemonEvoArray = []
            if let evoChain = pokemonList[row].evolutionChain {
                let evolutionChain = EvolutionChain(evolutionArray: evoChain)
                let evoIds = evolutionChain.evolutionIds
                for id in evoIds {
                    if id <= 151 {
                    self.pokemonEvoArray.append(pokemonList[id-1])
                    }
                }
                pokemonList[row].evoArray = pokemonEvoArray
            }
    }
    
}
