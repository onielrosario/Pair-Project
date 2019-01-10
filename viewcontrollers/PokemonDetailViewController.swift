//
//  PokemonDetailViewController.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    @IBOutlet weak var pokemonDetailImage: UIImageView!
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    var pokemons: PokemonCard! {
        didSet {
            DispatchQueue.main.async {
                self.pokemonCollectionView.reloadData()
            }
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonCollectionView.dataSource = self
      pokemonCollectionView.delegate = self
        setupImage(pokemon: pokemons)
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupImage(pokemon: PokemonCard) {
        ImageHelper.shared.fetchImage(urlString: pokemon.imageUrlHiRes) { (appError, image) in
            if let appError = appError {
                print(appError)
            }
            if let image = image {
                self.pokemonDetailImage.image = image
            }
        }
    }
}

extension PokemonDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons!.attacks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonDetailCell", for: indexPath) as?     PokemonDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setupSetup(pokemon: pokemons.attacks[indexPath.row])
        return cell
    }
}

extension PokemonDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}


