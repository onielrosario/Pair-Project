//
//  PokemonDetailCollectionViewCell.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class PokemonDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var attackName: UILabel!
    @IBOutlet weak var attackLevel: UILabel!
    @IBOutlet weak var attackDescription: UITextView!
    
    
    func setupSetup(pokemon: Attack) {
        self.attackName.text = pokemon.name
        self.attackLevel.text = pokemon.damage
        self.attackDescription.text = pokemon.text
    }
    
    
    
}
