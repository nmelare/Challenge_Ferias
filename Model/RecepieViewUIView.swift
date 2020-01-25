//
//  RecepieViewUIView.swift
//  Cuisine101
//
//  Created by Rayane Xavier on 23/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit

class RecepieViewUIView: UIView {

    func yourView(){
        yourView = RecepieViewUIView(frame:CGRect(x: 350, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 350))

        yourView.layer.cornerRadius = 10
    }
    
    
    view.addSubview(yourView)

}
