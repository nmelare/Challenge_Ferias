//
//  RecepieCollectionViewDataSouce.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 17/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit

class RecepieCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
}
