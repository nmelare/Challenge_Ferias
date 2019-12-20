//
//  PaginaTutorial.swift
//  Mulan
//
//  Created by Nathalia Melare on 09/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit


class PaginaTutorialViewController: UITableViewController {
    var dicas: Dica!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = dicas.nomeDaDica
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view : UIView = UIView(frame: CGRect.zero)
            return view
            
        }
        if section == 1 {
            let label1 = UILabel()
            label1.text = "    Dica"
            label1.textColor = UIColor(red: 184/255, green: 66/255, blue: 76/255, alpha: 1)
            label1.font = UIFont.boldSystemFont(ofSize: 22.0)
            label1.backgroundColor = UIColor.white
            return label1
            
        }
        
        let label3 = UILabel()
        label3.text = " "
        return label3
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ImagemDicas", for: indexPath) as? ImagemDicaCell {
                cell.OutletImagemDica.image = UIImage(named: dicas.nomedaimagem2)
                return cell
            }
            
        }
        if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Dicas", for: indexPath) as? TextDicaCell {
                cell2.outletDicas.text = dicas.dicas
                cell2.outletDicas.font = UIFont(name: "Arial", size: 20)

                return cell2
            }
        }
        // -> ERA CHAVES!
        return UITableViewCell()
    }
}
