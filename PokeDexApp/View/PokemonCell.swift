//
//  PokemonCell.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit
import Foundation

final class PokemonCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    static let identifier = "CellIdentifier"
    
    private let controlView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let pokeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var pokeNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .elephantBone()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .mainPink()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(controlView)
        controlView.addSubview(pokeImageView)
        controlView.addSubview(pokeNameLabel)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            
            controlView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            controlView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            controlView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            controlView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            
            pokeImageView.centerYAnchor.constraint(equalTo: controlView.centerYAnchor, constant: -10),
            pokeImageView.centerXAnchor.constraint(equalTo: controlView.centerXAnchor),
            pokeImageView.widthAnchor.constraint(equalTo: controlView.widthAnchor, constant: -40),
            pokeImageView.heightAnchor.constraint(equalTo: controlView.heightAnchor, constant: -40),
       
            pokeNameLabel.bottomAnchor.constraint(equalTo: controlView.bottomAnchor),
            pokeNameLabel.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor, constant: 3),
            pokeNameLabel.widthAnchor.constraint(equalTo: controlView.widthAnchor),
            pokeNameLabel.centerXAnchor.constraint(equalTo: controlView.centerXAnchor),
            
        ])
    }
    
    func setupPokemon(name: String, imageUrl: String) {
        pokeNameLabel.text = name
        PokeViewModel.shared.getPokemonImage(url: imageUrl) { image in
            self.pokeImageView.image = image
        }
        
    }
    
}
