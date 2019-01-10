//
//  pokemonAPIClient.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

final class APIClient {
    
    static func getPokemon(completionHandler: @escaping (AppError?, [PokemonCard]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks")
        { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(AppError.badURL(appError.errorMessage()), nil)
            } else if let data = data {
                do {
                    let pokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                    completionHandler(nil, pokemon.cards)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
    static func getAttacks(completionHandler: @escaping (AppError?, [Attack]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.pokemontcg.io/v1/cards?contains=imageUrl,imageUrlHiRes,attacks") { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(AppError.badURL(appError.errorMessage()), nil)
            } else if let data = data {
                do {
                    let pokemon = try JSONDecoder().decode(PokemonCard.self, from: data)
                    completionHandler(nil, pokemon.attacks)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
}
