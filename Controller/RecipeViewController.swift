//
//  ReceitaViewController.swift
//  Cuisine101
//
//  Created by Nathalia Melare on 15/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

class RecipeViewController: UIViewController {
    var recepie: Receita!
    @IBOutlet weak var pratoImagem: UIImageView!
    @IBAction func testModalButton(_ sender: Any) {
        handleSettings()
    }
    let settingsModal = SettingsModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController!.navigationBar.shadowImage = UIImage()
           self.navigationController!.navigationBar.isTranslucent = true

        pratoImagem.image = UIImage(named:recepie.nomeDaImagem2)
    }
    
    func handleSettings() {
        settingsModal.handleMore()
        settingsModal.collectionViewSetUp()
        settingsModal.firstAnimationModal()
    }
}
