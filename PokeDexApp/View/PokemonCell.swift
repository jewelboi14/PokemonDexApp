//
//  PokemonCell.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit
import Foundation

final class PokemonCell: UICollectionViewCell {
    
    //MARK: - Constants
    
    static let identifier = "CellIdentifier"
    
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
        
        contentView.addSubview(pokeImageView)
        contentView.addSubview(pokeNameLabel)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            pokeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10),
            pokeImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pokeImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40),
            pokeImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            pokeNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pokeNameLabel.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor, constant: 3),
            pokeNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            pokeNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
        ])
    }
    
    func setupPokemon(name: String, image: UIImage) {
        pokeNameLabel.text = name
        pokeImageView.image = image
    }
    
}
