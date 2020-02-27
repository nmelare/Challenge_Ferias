//
//  CollectionViewController.swift
//  MessageApp
//
//  Created by Nathalia Melare on 27/02/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    var pai: MessagesViewController?
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return receitas.count
    }
    
    var receitas = InternReceita.getAllRecepies()
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ReceitaCell,
            let image = UIImage(named: receitas[indexPath.row].nomeDaImagemMenu){
            cell.img.image = image
            return cell
        }
            
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pai?.selecionou(receita: receitas[indexPath.row])
    }
}

class ReceitaCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
}
