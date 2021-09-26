//
//  PokeData.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit

final class PokeListData {
    
    //MARK: - Properties
    
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var description: String?
    var attack: Int?
    var defense: Int?
    var height: Int?
    var weight: Int?
    var type: String?
    var evolutionChain: [[String: AnyObject]]?
    var evoArray: [PokeListData]?
    
    //MARK: - init
    
    init(id: Int, dictionary: [String: AnyObject]) {
        self.id = id
        self.name = dictionary["name"] as? String
        self.imageUrl = dictionary["imageUrl"] as? String
        self.description = dictionary["description"] as? String
        self.attack = dictionary["attack"] as? Int
        self.defense = dictionary["defense"] as? Int
        self.height = dictionary["height"] as? Int
        self.weight = dictionary["weight"] as? Int
        self.type = dictionary["type"] as? String
        self.evolutionChain = dictionary["evolutionChain"] as? [[String: AnyObject]]
        
        
    }
    
}

struct EvolutionChain {
    
    var evolutionArray: [[String: AnyObject]]?
    var evolutionIds = [Int]()
    
    init(evolutionArray: [[String: AnyObject]]) {
        self.evolutionArray = evolutionArray
        self.evolutionIds = setEvolutionIds()
    }
    
    private func setEvolutionIds() -> [Int] {
        var results = [Int]()
        evolutionArray?.forEach({ dictionary in
            if let idString = dictionary["id"] as? String {
                guard let id = Int(idString) else { return }
                results.append(id)
            }
        })
        return results
    }
}
