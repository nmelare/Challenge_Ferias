//
//  RecepieCollectionViewCell.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 17/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit

class TutorialCollectionViewCell: UICollectionViewCell {
    
    
    let label: UILabel = {
           let label = UILabel()
           label.frame = CGRect.zero
        label.text = "Foi"
           return  label
       }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        label.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
        
        addSubview(label)
        
        addConstrainsWithFormat(format: "H:|-20-[v0]|", views: label)
        addConstrainsWithFormat(format: "V:|-30-[v0]|", views: label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
