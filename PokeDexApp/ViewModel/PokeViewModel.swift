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
    
    private var pokeActualArray: [PokeListData]?
    
    
    //MARK: - Method to pass pokemon information to view
    
    //Pokemon info array
    
    func getPokemonList(completion: @escaping ([PokeListData]) -> ()) {
        NetworkManager.shared.fetchPokemonList { pokemon in
            self.pokemonList = pokemon
            completion(pokemon)
        }
    }
    
    //Pokemon evolution chain
    
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
