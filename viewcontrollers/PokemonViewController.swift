//
//  ViewController.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    
    private var pokemon = [PokemonCard]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        APIClient.getPokemon { (error, pokemon) in
            if let error = error {
                print(error)
            }
            if let pokemon = pokemon {
                self.pokemon = pokemon
            }
        }
    }
}

extension PokemonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as? PokemonCollectionViewCell else { return UICollectionViewCell() }
        let pokemonToSet = pokemon[indexPath.row]
        cell.configureImage(pokemon: pokemonToSet)
        return cell
    }
    
    
}

extension PokemonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 130, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
         guard let vc = storyBoard.instantiateViewController(withIdentifier: "PokemonDetailVC") as? PokemonDetailViewController else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.pokemons = pokemon[indexPath.row]
        
        present(vc, animated: true, completion: nil)
        
    }
}
