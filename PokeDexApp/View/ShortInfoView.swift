//
//  ShortInfoViewController.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import Foundation
import UIKit


//MARK: - PopUpDelegate

protocol PopUpDelegate {
    func dismissPopUpsHandle()
}

final class ShortInfoView: UIView {
    
    //MARK: - Properties
    
    var delegate: PopUpDelegate?
    
    private var pokeDefenceLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    private var pokeAttackLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    private var pokeTypeLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        return label
    }()
    
    private var pokeNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .elephantBone()
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .mainPink()
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.setTitle("x", for: .normal)
        button.backgroundColor = .mainPink()
        button.addTarget(self, action: #selector(dismissPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let pokeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let leftDefenceLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "defence"
        return label
    }()
    
    private let leftAttackLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "attack"
        return label
    }()
    
    private let leftTypeLabel: UILabel = {
        let label = UILabel()
        label.setupLabelCommonParameters(label)
        label.text = "type"
        return label
    }()
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    private func configureUI() {
        
        //add subview
        
        clipsToBounds = true
        backgroundColor = .elephantBone()
        addSubview(pokeImageView)
        addSubview(pokeNameLabel)
        addSubview(leftDefenceLabel)
        addSubview(leftAttackLabel)
        addSubview(leftTypeLabel)
        addSubview(pokeTypeLabel)
        addSubview(pokeDefenceLabel)
        addSubview(pokeAttackLabel)
        addSubview(dismissButton)
        
        //dynamic labels layout
        
        NSLayoutConstraint.activate([
            
            pokeImageView.heightAnchor.constraint(equalTo: heightAnchor, constant: -250),
            pokeImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: -200),
            pokeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokeImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -30),
            
            pokeNameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -135),
            pokeNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokeNameLabel.bottomAnchor.constraint(equalTo: pokeImageView.topAnchor, constant: -30),
            pokeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: -20),

            pokeTypeLabel.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor, constant: 6),
            pokeTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 180),
            pokeTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            pokeTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -110),
       
            pokeAttackLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 180),
            pokeAttackLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            pokeAttackLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            pokeAttackLabel.topAnchor.constraint(equalTo: pokeTypeLabel.bottomAnchor, constant: 6),
       
            pokeDefenceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 180),
            pokeDefenceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            pokeDefenceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            pokeDefenceLabel.topAnchor.constraint(equalTo: pokeAttackLabel.bottomAnchor, constant: 6),
        
        
        //non-dynamic labels layout
        
      
            leftTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            leftTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -180),
            leftTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -110),
            leftTypeLabel.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor, constant: 6),
        
            leftAttackLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            leftAttackLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -180),
            leftAttackLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65),
            leftAttackLabel.topAnchor.constraint(equalTo: leftTypeLabel.bottomAnchor, constant: 6),
        
            leftDefenceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            leftDefenceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -180),
            leftDefenceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            leftDefenceLabel.topAnchor.constraint(equalTo: leftAttackLabel.bottomAnchor, constant: 6),
        
            dismissButton.leftAnchor.constraint(equalTo: pokeNameLabel.rightAnchor, constant: 10),
            dismissButton.widthAnchor.constraint(equalToConstant: 40),
            dismissButton.heightAnchor.constraint(equalToConstant: 40),
            dismissButton.bottomAnchor.constraint(equalTo: pokeNameLabel.bottomAnchor, constant: -17)
            
        ])
    }
    
    //MARK: - Setup pokemon inforamtion inside labels
    
    func setupPokeInfo(name: String, attack: String, defence: String, type: String, image: UIImage) {
        self.pokeTypeLabel.text = type
        self.pokeAttackLabel.text = attack
        self.pokeDefenceLabel.text = defence
        self.pokeNameLabel.text = name
        self.pokeImageView.image = image
    }
    
    //MARK: - Dismiss pressed selector
    
    @objc func dismissPressed() {
        delegate?.dismissPopUpsHandle()
    }
    
}

//MARK: - UILabel extension

extension UILabel {
    func setupLabelCommonParameters(_ label: UILabel) {
        label.textColor = .gray
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .elephantBoneDark()
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.elephantBone().cgColor
    }
}
