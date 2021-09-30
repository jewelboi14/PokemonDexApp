//
//  NetworkManager.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit

final class NetworkManager {
    
    //MARK: - Constants
    
    private let mainUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    //MARK: - JSON handling methods
    
    func fetchPokemonList(completion: @escaping ([PokeListData?]) -> ()) {
        guard let url = URL(string: mainUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let pokemon = try JSONDecoder().decode([PokeListData?].self, from: data)
                DispatchQueue.main.async {
                    completion(pokemon)
                }
                
            } catch {
                print("can't get pokemon list \(error)")
            }
        }
        task.resume()
    }
    
    func downloadSprite(with urlString: String, completion: @escaping (UIImage) -> ()) {
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
