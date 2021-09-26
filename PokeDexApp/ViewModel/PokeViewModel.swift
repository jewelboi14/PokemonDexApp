//
//  PokeViewModel.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import Foundation

final class PokeViewModel {
    
    //MARK: - Properties
    
    var isFiltering: Bool?
    
    var pokemonList: [PokeListData] = []
    
    var filteredPokemon: [PokeListData] = []
    
    var pokemonEvoArray: [PokeListData] = []
    
    var pokeActualArray: [PokeListData]?
    
    
    //MARK: - Function to pass pokemon array to view
    
    func getPokemonList(completion: @escaping ([PokeListData]) -> ()) {
        NetworkManager.shared.fetchPokemonList { pokemon in
            self.pokemonList = pokemon
            completion(pokemon)
        }
    }
    
    func getEvoChain(at row: Int) {
        pokemonEvoArray = []
        if isFiltering == true {
            pokeActualArray = filteredPokemon
        } else {
            pokeActualArray = pokemonList
        }
        
        if let evoChain = pokeActualArray?[row].evolutionChain {
            let evolutionChain = EvolutionChain(evolutionArray: evoChain)
            let evoIds = evolutionChain.evolutionIds
                for id in evoIds {
                    if id <= 151 {
                            self.pokemonEvoArray.append(pokemonList[id-1])
                    }
                }
            
            pokeActualArray?[row].evoArray = pokemonEvoArray
        }
    }
    
}
