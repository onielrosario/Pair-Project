//
//  MagicCollectionViewCell.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class MagicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var magicThumbnail: UIImageView!
    
    
    func configureCell(magicCard: MagicCard ) {
        ImageHelper.shared.fetchImage(urlString: magicCard.imageUrl ?? "") { (appError, image) in
            if let appError = appError {
                print("error image \(appError)")
            } else if let image = image {
                self.magicThumbnail.image = image
            }
        }
    }
    
    override func prepareForReuse() {
        magicThumbnail.image = nil
    }
    
}
