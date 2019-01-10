//
//  PokemonCollectionViewCell.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pokemonThumbnail: UIImageView!
    
    func configureImage(pokemon: PokemonCard) {
        ImageHelper.shared.fetchImage(urlString: pokemon.imageUrl) { (appError, pokemonImage) in
            if let appError = appError {
                print(appError)
            } else if let pokemonImage = pokemonImage {
                self.pokemonThumbnail.image = pokemonImage
            }
        }
    }
    
    
    
    
}
