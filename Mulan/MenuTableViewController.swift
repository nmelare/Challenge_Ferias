//
//  MenuTableViewController.swift
//  Cuisine101
//
//  Created by Rayane Xavier on 15/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    var renevue: [Receita] = []
    var filterRevenue: [Receita] = []
    var segmentadValue: [Receita] = []
    let segmentindicator: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = UIColor.init(red: 353, green: 0, blue: 0, alpha: 1)
    return v
    }()
    
    // MARK: - Table view data source
    @IBOutlet weak var SegmentedControlOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesSearchBarWhenScrolling = false
        creatSearchBar()
        SegmentedControlOutlet.selectedSegmentIndex = 0
        segmentadValue = InternReceita.getAllRecepies()
        SegmentedControlOutlet.backgroundColor = .clear
        SegmentedControlOutlet.tintColor = .clear
        SegmentedControlOutlet.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir", size: 22) ?? UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.init(red: 353, green: 0, blue: 0, alpha: 1)], for: .selected)
        SegmentedControlOutlet.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir", size: 20) ?? UIFont.systemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        self.view.addSubview(segmentindicator)
        segmentindicator.topAnchor.constraint(equalTo: SegmentedControlOutlet.bottomAnchor).isActive = true
        segmentindicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        segmentindicator.widthAnchor.constraint(equalToConstant: CGFloat(15 + SegmentedControlOutlet.titleForSegment(at: 0)!.count * 8)).isActive = true
        segmentindicator.centerXAnchor.constraint(equalToSystemSpacingAfter: SegmentedControlOutlet.centerXAnchor, multiplier: 0/4).isActive = true
        
    }
    

    @IBAction func SegmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentadValue = InternReceita.getAllRecepies()
        case 1:
            segmentadValue = MenuTableViewController.getRoastReceitas()
        case 2:
            segmentadValue = MenuTableViewController.getCookedReceitas()
        case 3:
            segmentadValue = MenuTableViewController.getFriedReceitas()
        default:
            break
        }
        
        let numberOfSegments = CGFloat(SegmentedControlOutlet.numberOfSegments)
        let selectedIndex = CGFloat(sender.selectedSegmentIndex)
        let titlecount = CGFloat((SegmentedControlOutlet.titleForSegment(at: sender.selectedSegmentIndex)!.count))
        segmentindicator.topAnchor.constraint(equalTo: SegmentedControlOutlet.bottomAnchor).isActive = true
        segmentindicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        segmentindicator.widthAnchor.constraint(equalToConstant: CGFloat(15 + titlecount * 8)).isActive = true
        segmentindicator.centerXAnchor.constraint(equalToSystemSpacingAfter: SegmentedControlOutlet.centerXAnchor, multiplier:  1.0/(numberOfSegments/CGFloat(3.0 + CGFloat(selectedIndex-1.0)*2.0))).isActive = true

        UIView.animate(withDuration: 0.5, animations: {
        self.view.layoutIfNeeded()
        self.segmentindicator.transform = CGAffineTransform(scaleX: 1.4, y: 1)
        }) { (finish) in
        UIView.animate(withDuration: 0.4, animations: {
        self.segmentindicator.transform = CGAffineTransform.identity
        })
        }
        tableView.reloadData()
    }
    
    
    static func getCookedReceitas() -> [Receita] {
        let all = InternReceita.getAllRecepies()
        var cookedReceitas: [Receita] = []
        for receita in all where receita.categoria == "Cooked" {
            cookedReceitas.append(receita)
        }
        return cookedReceitas
    }
    
    static func getFriedReceitas() -> [Receita] {
        let all = InternReceita.getAllRecepies()
        var friedReceitas: [Receita] = []
        for receita in all where receita.categoria == "Frying" {
            friedReceitas.append(receita)
        }
        return friedReceitas
        
    }
    
    static func getRoastReceitas() -> [Receita] {
        let all = InternReceita.getAllRecepies()
        var roastReceitas: [Receita] = []
        for receita in all where receita.categoria == "Roast" {
            roastReceitas.append(receita)
        }
        return roastReceitas

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if isFiltering(){
//            return filterRevenue.count
//        }
        return segmentadValue.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IDMenuCell") as? CardsMenuTableViewCell {
//            if isFiltering(){
//                cell.imagemView.image = UIImage(named: filterRevenue[indexPath.row].nomeDaImagem)
//                } else {
                cell.imageRecipeCardMenu.image = UIImage(named: segmentadValue[indexPath.row].nomeDaImagem2)
                cell.labelNameRecipeCardMenu.text = segmentadValue[indexPath.row].nomeDaReceita
                cell.labelTimeRecipeCardMenu.text = segmentadValue[indexPath.row].tempoDePreparo
                cell.labelPeopleRecipeCardMenu.text = segmentadValue[indexPath.row].quantasPessoasServe
//                }
            return cell
        }
        return UITableViewCell()
    }

}

extension MenuTableViewController: UISearchBarDelegate {
    func creatSearchBar() {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Ingredientes"
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
    }
}
