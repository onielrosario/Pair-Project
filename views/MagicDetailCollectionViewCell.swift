//
//  MagicDetailCollectionViewCell.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class MagicDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var magicDetailImage: UIImageView!
    @IBOutlet weak var magicDetailName: UILabel!
    @IBOutlet weak var magicDetailLanguage: UILabel!
    @IBOutlet weak var magicDetailDescription: UITextView!
    


    func configureDetailCell(magicCard: MagicCard ) {
        ImageHelper.shared.fetchImage(urlString: magicCard.imageUrl ?? "") { (appError, magicImage) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let magicImage = magicImage {
                self.magicDetailImage.image = magicImage
            }
        }
        magicDetailName.text = magicCard.name
        _ = magicCard.foreignNames
    }
    
    func configureLanguage(foreign: ForeignName)
    {
        magicDetailLanguage.text = foreign.language
        magicDetailDescription.text = foreign.text
    }
    
    
}
