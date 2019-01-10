//
//  MagicDetailViewController.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {
    var detailmagic = [MagicCard]() {
        didSet {
            DispatchQueue.main.async {
                self.magicDetailCollection.reloadData()
            }
        }
    }
    @IBOutlet weak var magicDetailCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        magicDetailCollection.dataSource = self
        
    }
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailmagic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCollectionViewCell else { return UICollectionViewCell() }
        let card = detailmagic[indexPath.row]
        cell.configureDetailCell(magicCard: card)
        
        return cell
    }
    
    
}
