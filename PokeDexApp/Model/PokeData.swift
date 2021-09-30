//
//  PokeData.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

struct PokeListData: Decodable {
    
    var name: String
    var imageUrl: String
    var id: Int
    var description: String
    var attack: Int
    var defense: Int
    var height: Int
    var weight: Int
    var type: String
    var evolutionChain: [EvolutionChain]?
    
}

struct EvolutionChain: Decodable {
    let name: String
    let id: String
   
}
