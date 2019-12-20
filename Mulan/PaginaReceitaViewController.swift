//
//  Receita.swift
//  Mulan
//
//  Created by Nathalia Melare on 09/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

class PaginaReceitaViewController: UITableViewController {
    
    var comidinha : Receita!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = comidinha.nomeDaReceita
//        navigationController?.navigationBar.isHidden = true
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
            label1.text = "    Ingredientes"
            label1.textColor = UIColor(red: 184/255, green: 66/255, blue: 76/255, alpha: 1)
            label1.font = UIFont.boldSystemFont(ofSize: 22.0)
            label1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            return label1
            
        }
        if section == 2 {
            let label2 = UILabel()
            label2.text = "    Como Fazer"
            label2.textColor = UIColor(red: 184/255, green: 66/255, blue: 76/255, alpha: 1)
            label2.font = UIFont.boldSystemFont(ofSize: 22.0)
            label2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            return label2
            
        }
        
        let label3 = UILabel()
        label3.text = " "
        label3.backgroundColor = UIColor.lightGray
        return label3
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        if section == 1 {
            return comidinha.ingredientes.count
        }
        if section == 2 {
            return comidinha.modoDePreparo.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ImagemComida", for: indexPath) as? ImagemCell {
                cell.ImageView.image = UIImage(named: comidinha.nomeDaImagem2)
                return cell
            }
            
        }
        if indexPath.section == 1 {
            if let cell2 = tableView.dequeueReusableCell(withIdentifier: "Ingredientes", for: indexPath) as? ConteudoCell {
                cell2.outletLabel.text = comidinha.ingredientes[indexPath.row]
                cell2.outletLabel.font = UIFont(name: "Arial", size: 20)
                return cell2
            }
        }
        if indexPath.section == 2 {
            if let cell3 = tableView.dequeueReusableCell(withIdentifier: "Ingredientes", for: indexPath) as? ConteudoCell {
                cell3.outletLabel.text = comidinha.modoDePreparo[indexPath.row]
                cell3.outletLabel.font = UIFont(name: "Arial", size: 20)
                return cell3
            }
        }
        return UITableViewCell()
    }
}


