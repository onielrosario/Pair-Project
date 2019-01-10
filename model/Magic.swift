//
//  Magic.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

struct Magic: Codable {
    let cards: [MagicCard]
}

struct MagicCard: Codable {
    let name: String
    let imageUrl: String?
    let foreignNames: [ForeignName]
}

struct ForeignName: Codable {
    let name: String
    let text: String
    let imageUrl: String?
    let language: String
}
