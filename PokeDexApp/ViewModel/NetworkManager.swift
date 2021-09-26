//
//  NetworkManager.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    //MARK: - Constants
    
    let mainUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    //MARK: - JSON handling methods
    
    func fetchPokemonList(completion: @escaping ([PokeListData]) -> ()) {
        var pokemonArray = [PokeListData]()
        guard let url = URL(string: mainUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                guard let pokemon = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }
                for (key, result) in pokemon.enumerated() {
                    if let dictionary = result as? [String: AnyObject] {
                        let pokemon = PokeListData(id: key, dictionary: dictionary)
                        guard let imageUrl = pokemon.imageUrl else { return }
                        self.downloadSprite(with: imageUrl) { image in
                            pokemon.image = image
                            pokemonArray.append(pokemon)
                            pokemonArray.sort { poke1, poke2 -> Bool in
                                return poke1.id! < poke2.id!
                            }
                            DispatchQueue.main.async {
                                completion(pokemonArray)
                            }
                        }
                    }
                }
            } catch {
                print("can't get pokemon list \(error)")
            }
            
        }
        task.resume()
    }
    
    private func downloadSprite(with urlString: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(image)
                }
            }
        }
        task.resume()
    }
    
}
