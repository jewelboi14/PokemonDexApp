//
//  ViewController.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import UIKit

final class PokeListViewController: UICollectionViewController {
    
    
    //MARK: - Constants
    
    private let moreDetailsVc = DetailsViewController()
    private let viewModel = PokeViewModel()
    private let tapRecognizer = UITapGestureRecognizer()
    
    //MARK: - Properties
    
    private let searchBar = UISearchBar()
    
    private let moreInfoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainPink()
        button.addTarget(self, action: #selector(moreInfoButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.titleLabel?.numberOfLines = 2
        button.setTitle("More Information", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.titleLabel?.textColor = .elephantBone()
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy private var popUpView: ShortInfoView = {
        let view = ShortInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.delegate = self
        return view
    }()
    
    private let blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: effect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.register(PokemonCell.self,
                                forCellWithReuseIdentifier: PokemonCell.identifier)
        configureViewComponents()
        
        viewModel.getPokemonList { [weak self] pokemon in
            self?.collectionView.reloadData()
        }
        
        searchBar.delegate = self
        setupGestureRecognizer()
        
    }
    
    //MARK: - Layout and Setup UI methods
    
    private func configureViewComponents() {
        
        collectionView.backgroundColor = .elephantBone()
        
        //navigation controller
        
        navigationController?.navigationBar.barTintColor = .mainPink()
        navigationController?.navigationBar.tintColor = .elephantBone()
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Pokedex"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(showSearchBar))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.elephantBone()]
        navigationController?.navigationBar.isTranslucent = false
        
        //searchBar
        
        searchBar.barTintColor = .elephantBone()
        searchBar.searchTextField.textColor = .gray
        searchBar.searchTextField.backgroundColor = .elephantBone()
        
        //blurView
        
        view.addSubview(blurView)
        blurView.alpha = 0
        
    }
    
    //MARK: - Layout pop up window and blur effect
    
    private func layoutPopUpView() {
        NSLayoutConstraint.activate([
            
            //popUpView
            
            popUpView.widthAnchor.constraint(equalToConstant: view.frame.width-64),
            popUpView.heightAnchor.constraint(equalToConstant: view.frame.width-20),
            popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //blurView
            
            blurView.leftAnchor.constraint(equalTo: view.leftAnchor),
            blurView.rightAnchor.constraint(equalTo: view.rightAnchor),
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //moreInfoButton
            
            moreInfoButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            moreInfoButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.10),
            moreInfoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250),
            moreInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    //MARK: - Selectors
    
    @objc func showSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
        searchBar.becomeFirstResponder()
    }
    
    @objc func blurTapped() {
        dismissPopUpsHandle()
    }
    
    @objc func moreInfoButtonTapped() {
        navigationController?.pushViewController(moreDetailsVc, animated: true)
        dismissPopUpsHandle()
    }
    
    //MARK: - Gestrure recognizer
    
    private func setupGestureRecognizer() {
        tapRecognizer.addTarget(self, action: #selector(blurTapped))
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 1
        blurView.addGestureRecognizer(tapRecognizer)
    }
    
}

//MARK: - UICollectionViewDataSource

extension PokeListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pokemon = viewModel.pokemonList[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell  else {
            return UICollectionViewCell()
        }
        
        cell.setupPokemon(name: pokemon.name ?? "", image: pokemon.image ?? UIImage())
        cell.backgroundColor = .elephantBoneDark()
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PokeListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 3
        return CGSize(width: width, height: width)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //popUp window gets triggered
        
        view.addSubview(popUpView)
        view.addSubview(moreInfoButton)
        popUpView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        moreInfoButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        moreInfoButton.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 1
            self.moreInfoButton.alpha = 1
            self.popUpView.alpha = 1
            self.moreInfoButton.transform = CGAffineTransform.identity
            self.popUpView.transform = CGAffineTransform.identity
        }
        layoutPopUpView()
        
        //pokemon info gets shown
        
        let pokemon = viewModel.pokemonList[indexPath.row]
        
        popUpView.setupPokeInfo(name: pokemon.name ?? "unknown",
                                attack: String(pokemon.attack ?? 0),
                                defence: String(pokemon.defense ?? 0),
                                type: pokemon.type ?? "unknown",
                                image: pokemon.image ?? UIImage())
        
        //moreDetails menu configure
        
        viewModel.getEvoChain(at: indexPath.row)
        if viewModel.pokemonEvoArray.count > 1 {
            moreDetailsVc.setupEvolution(evo1Image: pokemon.evoArray?[0].image ?? UIImage(),
                                         evo2Image: pokemon.evoArray?[1].image ?? UIImage())
        }
        moreDetailsVc.setupPokeInfo(name: pokemon.name ?? "unknown",
                                    attack: String(pokemon.attack ?? 0),
                                    defence: String(pokemon.defense ?? 0),
                                    type: pokemon.type ?? "unknown",
                                    image: pokemon.image ?? UIImage(),
                                    weight: String(pokemon.weight ?? 0),
                                    height: String(pokemon.height ?? 0),
                                    description: pokemon.description ?? "unknown"
        )
    }
    
}

//MARK: - UISearchBarDelegate

extension PokeListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(showSearchBar))
        searchBar.showsCancelButton = false
        searchBar.searchTextField.text = ""
        viewModel.getPokemonList { [weak self] pokemon in
            self?.collectionView.reloadData()
        }
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != "" {
            viewModel.pokemonList = viewModel.pokemonList.filter({
                (pokemon: PokeListData) in
                
                return pokemon.name?.lowercased().contains(searchText.lowercased()) ?? false
            })
            collectionView.reloadData()
        } else {
            viewModel.getPokemonList { [weak self] pokemon in
                self?.collectionView.reloadData()
            }
        }
        
    }
}

//MARK: - PopUpDelegate implementation

extension PokeListViewController: PopUpDelegate {
    func dismissPopUpsHandle() {
        UIView.animate(withDuration: 0.5) {
            self.blurView.alpha = 0
            self.moreInfoButton.alpha = 0
            self.popUpView.alpha = 0
            self.popUpView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.moreInfoButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            self.popUpView.removeFromSuperview()
            self.moreInfoButton.removeFromSuperview()
            
        }
    }
    
}


