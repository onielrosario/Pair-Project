//
//  magicAPIClient.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation

final class magicAPIClient {
    static func getMagics(completionHandler: @escaping (AppError?, [MagicCard]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.magicthegathering.io/v1/cards?contains=imageUrl")
        { (appError, data, httpResponse) in
            if let appError = appError {
                completionHandler(AppError.badURL(appError.errorMessage()), nil)
            } else if let data = data {
                do {
                    let cards = try JSONDecoder().decode(Magic.self, from: data)
                    completionHandler(nil, cards.cards)
                } catch {
                    completionHandler(AppError.decodingError(error), nil)
                }
            }
        }
    }
    
    static func getLanguages(completionHandler: @escaping(AppError?, [ForeignName]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.magicthegathering.io/v1/cards?contains=imageUrl") { (appError, data, response) in
            if let appError = appError {
              print(appError)
            } else if let data = data {
                do {
                    let foreignNames = try JSONDecoder().decode(MagicCard.self, from: data)
                    completionHandler(nil, foreignNames.foreignNames)
                } catch {
                    completionHandler(appError, nil)
                }
            }
        }
    }
}
