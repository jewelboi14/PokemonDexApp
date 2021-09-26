//
//  DetailsViewController.swift
//  PokeDexApp
//
//  Created by Михаил on 24.09.2021.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    
    let pokeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let pokeNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .elephantBoneDark()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    let descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = .elephantBoneDark()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let parameterView: UIView = {
        let view = UIView()
        view.backgroundColor = .elephantBoneDark()
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pokeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .gray
        return label
    }()
    
    let pokeTypeLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    let pokeDefenseLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    let pokeAttackLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    let pokeWeightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    let pokeHeightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    let leftTypeLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "Type:"
        return label
    }()
    
    let leftDefenseLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "Defense:"
        return label
    }()
    
    let leftAttackLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "Attack:"
        return label
    }()
    
    let leftWeightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "Weight:"
        return label
    }()
    
    let leftHeightLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "Height:"
        return label
    }()
    
    
    let firstEvolutionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elephantBone()
        return imageView
    }()
    
    let secondEvolutionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .elephantBone()
        return imageView
    }()
    
    let evolutionBottomLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "evolution chain"
        label.backgroundColor = .elephantBone()
        return label
        
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    //MARK: - Layouts and UI Creation
    
    func setupUI() {
        view.backgroundColor = .elephantBone()
        
        
        //add subview
        view.addSubview(pokeNameLabel)
        view.addSubview(descriptionView)
        descriptionView.addSubview(pokeDescriptionLabel)
        view.addSubview(pokeImageView)
        view.addSubview(parameterView)
        parameterView.addSubview(leftTypeLabel)
        parameterView.addSubview(leftAttackLabel)
        parameterView.addSubview(leftDefenseLabel)
        parameterView.addSubview(leftWeightLabel)
        parameterView.addSubview(leftHeightLabel)
        parameterView.addSubview(pokeTypeLabel)
        parameterView.addSubview(pokeAttackLabel)
        parameterView.addSubview(pokeDefenseLabel)
        parameterView.addSubview(pokeWeightLabel)
        parameterView.addSubview(pokeHeightLabel)
        view.addSubview(firstEvolutionImageView)
        view.addSubview(secondEvolutionImageView)
        view.addSubview(evolutionBottomLabel)
        
        
        
        NSLayoutConstraint.activate([
            
            //name
            
            
            pokeNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            pokeNameLabel.heightAnchor.constraint(equalToConstant: 50),
            pokeNameLabel.topAnchor.constraint(equalTo: view.topAnchor),
            
            
            //image
            
            pokeImageView.topAnchor.constraint(equalTo: pokeNameLabel.bottomAnchor, constant: 35),
            pokeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor,
                                                   constant: -90),
            pokeImageView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                 multiplier: 0.4),
            pokeImageView.heightAnchor.constraint(equalTo: view.widthAnchor,
                                                  multiplier: 0.4),
            
            //description
            
            descriptionView.leftAnchor.constraint(equalTo: pokeImageView.rightAnchor,
                                                       constant: 30),
            descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                        constant: -10),
            descriptionView.heightAnchor.constraint(equalTo: pokeImageView.heightAnchor,
                                                         multiplier: 1.3),
            descriptionView.centerYAnchor.constraint(equalTo: pokeImageView.centerYAnchor),
            
            
            pokeDescriptionLabel.rightAnchor.constraint(equalTo: descriptionView.rightAnchor, constant: -10),
            pokeDescriptionLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10),
            pokeDescriptionLabel.heightAnchor.constraint(equalTo: descriptionView.heightAnchor, multiplier: 0.9),
            
            //parameterView
            
            parameterView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            parameterView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 46),
            parameterView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            parameterView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            //left labels
            
            leftTypeLabel.topAnchor.constraint(equalTo: parameterView.topAnchor, constant: 15),
            leftTypeLabel.leftAnchor.constraint(equalTo: parameterView.leftAnchor, constant: 10),
            leftTypeLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            leftTypeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            leftAttackLabel.topAnchor.constraint(equalTo: leftTypeLabel.bottomAnchor, constant: 10),
            leftAttackLabel.leftAnchor.constraint(equalTo: parameterView.leftAnchor, constant: 10),
            leftAttackLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            leftAttackLabel.heightAnchor.constraint(equalToConstant: 50),
            
            leftDefenseLabel.topAnchor.constraint(equalTo: leftAttackLabel.bottomAnchor, constant: 10),
            leftDefenseLabel.leftAnchor.constraint(equalTo: parameterView.leftAnchor, constant: 10),
            leftDefenseLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            leftDefenseLabel.heightAnchor.constraint(equalToConstant: 50),
            
            leftHeightLabel.topAnchor.constraint(equalTo: leftDefenseLabel.bottomAnchor, constant: 10),
            leftHeightLabel.leftAnchor.constraint(equalTo: parameterView.leftAnchor, constant: 10),
            leftHeightLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            leftHeightLabel.heightAnchor.constraint(equalToConstant: 50),
            
            leftWeightLabel.topAnchor.constraint(equalTo: leftHeightLabel.bottomAnchor, constant: 10),
            leftWeightLabel.leftAnchor.constraint(equalTo: parameterView.leftAnchor, constant: 10),
            leftWeightLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            leftWeightLabel.heightAnchor.constraint(equalToConstant: 50),
            
            //right labels
            
            pokeTypeLabel.topAnchor.constraint(equalTo: parameterView.topAnchor, constant: 15),
            pokeTypeLabel.rightAnchor.constraint(equalTo: parameterView.rightAnchor, constant: -10),
            pokeTypeLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            pokeTypeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pokeAttackLabel.topAnchor.constraint(equalTo: pokeTypeLabel.bottomAnchor, constant: 10),
            pokeAttackLabel.rightAnchor.constraint(equalTo: parameterView.rightAnchor, constant: -10),
            pokeAttackLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            pokeAttackLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pokeDefenseLabel.topAnchor.constraint(equalTo: pokeAttackLabel.bottomAnchor, constant: 10),
            pokeDefenseLabel.rightAnchor.constraint(equalTo: parameterView.rightAnchor, constant: -10),
            pokeDefenseLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            pokeDefenseLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pokeHeightLabel.topAnchor.constraint(equalTo: pokeDefenseLabel.bottomAnchor, constant: 10),
            pokeHeightLabel.rightAnchor.constraint(equalTo: parameterView.rightAnchor, constant: -10),
            pokeHeightLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            pokeHeightLabel.heightAnchor.constraint(equalToConstant: 50),
            
            pokeWeightLabel.topAnchor.constraint(equalTo: pokeHeightLabel.bottomAnchor, constant: 10),
            pokeWeightLabel.rightAnchor.constraint(equalTo: parameterView.rightAnchor, constant: -10),
            pokeWeightLabel.widthAnchor.constraint(equalTo: parameterView.widthAnchor, multiplier: 0.45),
            pokeWeightLabel.heightAnchor.constraint(equalToConstant: 50),
            
            
            //evolution  chain images
            
            firstEvolutionImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            firstEvolutionImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            firstEvolutionImageView.topAnchor.constraint(equalTo: parameterView.bottomAnchor, constant: 15),
            firstEvolutionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            
            secondEvolutionImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            secondEvolutionImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            secondEvolutionImageView.topAnchor.constraint(equalTo: parameterView.bottomAnchor, constant: 15),
            secondEvolutionImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90),
            
            
            evolutionBottomLabel.topAnchor.constraint(equalTo: secondEvolutionImageView.bottomAnchor, constant: 5),
            evolutionBottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            evolutionBottomLabel.heightAnchor.constraint(equalToConstant: 30),
            evolutionBottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    func setupPokeInfo(name: String,
                       attack: String,
                       defence: String,
                       type: String,
                       image: UIImage,
                       weight: String,
                       height: String,
                       description: String
    ) {
        self.pokeDescriptionLabel.text = description
        self.pokeHeightLabel.text = height
        self.pokeWeightLabel.text = weight
        self.pokeTypeLabel.text = type
        self.pokeAttackLabel.text = attack
        self.pokeDefenseLabel.text = defence
        self.pokeNameLabel.text = name
        self.pokeImageView.image = image
    }
    
    func setupEvolution(evo1Image: UIImage, evo2Image: UIImage) {
        self.firstEvolutionImageView.image = evo1Image
        self.secondEvolutionImageView.image = evo2Image
    }
    
}
