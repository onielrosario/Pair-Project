//
//  MagicDetailViewController.swift
//  PairProject
//
//  Created by Oniel Rosario on 1/9/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {
    var detailmagic: MagicCard!
    var detailLanguage = [ForeignName]() {
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
        getLanguages()
    }
    @IBAction func dismissButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func getLanguages() {
        magicAPIClient.getLanguages { (appError, foreigns) in
            if let appError = appError {
                print(appError)
            } else if let foreigns = foreigns {
                self.detailLanguage = foreigns
            }
        }
    }
}
extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailmagic.foreignNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetailCell", for: indexPath) as? MagicDetailCollectionViewCell else { return UICollectionViewCell() }
          let name = detailmagic.foreignNames[indexPath.row]
//        let foreigns = card.foreignNames[indexPath.row]
        cell.configureDetailCell(magicCard: detailmagic)
        cell.configureLanguage(foreign: name)
        
        return cell
    }
}
