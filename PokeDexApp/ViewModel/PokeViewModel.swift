//
//  PokeViewModel.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit
import Foundation

final class PokeViewModel {
    
    //MARK: - Properties
    
    static let shared = PokeViewModel()
    
    private let networkManager = NetworkManager()
    
    var isFiltering: Bool?

    var pokemonList: [PokeListData?] = []
    
    var filteredPokemon: [PokeListData?] = []
    
    var pokemonEvoArray: [PokeListData?] = []
    
    private var pokeActualArray: [PokeListData?] = []
    
    //MARK: - Method to pass pokemon information to view
    
    //Pokemon info array
    
    func getPokemonList(completion: @escaping ([PokeListData?]) -> ()) {
        networkManager.fetchPokemonList { pokemon in
            self.pokemonList = pokemon
            completion(pokemon)
            self.pokemonList.removeFirst(1)
        }
    }
    
    func getPokemonImage(url: String, completion: @escaping (UIImage)->()) {
        networkManager.downloadSprite(with: url) { image in
            completion(image)
        }
    }
    
    func getPokeEvolution(id: Int) {
        pokemonEvoArray = []
        if isFiltering == true {
            pokeActualArray = filteredPokemon
        } else {
            pokeActualArray = pokemonList
        }
        
        let evoArray = pokeActualArray[id]?.evolutionChain
        
        evoArray?.forEach({ pokemon in
            if let pokemonId = Int(pokemon.id){
                if pokemonId <= 151 {
                    pokemonEvoArray.append(pokemonList[pokemonId-1])
                }
            }
        })
    }
    
}
