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
        
    @IBAction func testModalButton(_ sender: Any) {
        handleSettings()
    }

    let settingsModal = SettingsModal()
    
    override func viewDidLoad() {
        
    }
    
    func handleSettings() {
        settingsModal.handleMore()
        settingsModal.collectionViewSetUp()
        settingsModal.firstAnimationModal()
    }
}
