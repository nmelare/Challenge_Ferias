//
//  ReceitaViewController.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 15/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

class ReceitaViewController: UIViewController {
    
    @IBOutlet weak var pratoImagem: UIImageView!
    
    func handleMore() {
        let blackView = UIView()
        blackView.backgroundColor = UIColor.white
        blackView.alpha = 0.5
        
        view.addSubview(blackView)
        
    }
}
