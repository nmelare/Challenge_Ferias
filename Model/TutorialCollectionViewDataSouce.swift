//
//  RecepieCollectionViewDataSouce.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 17/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//
import UIKit

class TutorialCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
        var tutorials : [Receita] = []
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? TutorialCollectionViewCell {
                cell.text.font = .systemFont(ofSize: 20)
                return cell
            }
            return UICollectionViewCell()
        }
    
}
