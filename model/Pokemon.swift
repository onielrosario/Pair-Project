//
//  Pokemon.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let cards: [PokemonCard]
}

struct PokemonCard: Codable {
    let imageUrl: String
    let imageUrlHiRes: String
    let attacks: [Attack]
}

struct Attack: Codable {
    let name: String
    let damage: String
    let text: String
}
