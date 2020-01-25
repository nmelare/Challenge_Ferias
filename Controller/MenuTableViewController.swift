//
//  MenuTableViewController.swift
//  Cuisine101
//
//  Created by Rayane Xavier on 15/01/20.
//  Copyright © 2020 Nathalia Melare. All rights reserved.
//

import UIKit
enum CategoryOfRenevue: String {
    case cooked = "Cooked"
    case frying = "Frying"
    case roast = "Roast"
    case drink = "Drink"
}

class MenuTableViewController: UITableViewController {

    var allrenevue: [Receita] = []
    var filterRenevue: [Receita] = []
    let searchBar = UISearchBar()
    
    let segmentindicator: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.8326148391, green: 0.3012730181, blue: 0.3521553278, alpha: 1)
    return v
    }()
    
    // MARK: - Table view data source
    @IBOutlet weak var SegmentedControlOutlet: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesSearchBarWhenScrolling = false
        creatSearchBar()
        allrenevue = InternReceita.getAllRecepies()
        filterRenevue = allrenevue

        SegmentedControlOutlet.selectedSegmentIndex = 0
        SegmentedControlOutlet.backgroundColor = .clear
        SegmentedControlOutlet.tintColor = .clear
        SegmentedControlOutlet.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir-Medium", size: 17) ?? UIFont.boldSystemFont(ofSize: 21),NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.8326148391, green: 0.3012730181, blue: 0.3521553278, alpha: 1)], for: .selected)
        SegmentedControlOutlet.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir-Medium", size: 16) ?? UIFont.boldSystemFont(ofSize: 21),NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        
        self.view.addSubview(segmentindicator)
        segmentindicator.topAnchor.constraint(equalTo: SegmentedControlOutlet.bottomAnchor).isActive = true
        segmentindicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        segmentindicator.widthAnchor.constraint(equalToConstant: CGFloat(15 + SegmentedControlOutlet.titleForSegment(at: 0)!.count * 8)).isActive = true
        segmentindicator.centerXAnchor.constraint(equalToSystemSpacingAfter: SegmentedControlOutlet.centerXAnchor, multiplier: 0/4).isActive = true
    }
    
    // MARK: - Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filterRenevue = allrenevue
            tableView.reloadData()
            return
        }
        
        filterRenevue = allrenevue.filter({(renevue: Receita) -> Bool in
            for ingredient in renevue.ingredientes {
                if ingredient.lowercased().contains(searchText.lowercased()){
                        return true
                    }
                }
                return false
            })
            tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            filterRenevue = allrenevue
        case 1:
            filterRenevue = allrenevue.filter({(renevue: Receita) -> Bool in
                renevue.categoria == CategoryOfRenevue.roast.rawValue
            })
        case 2:
            filterRenevue = allrenevue.filter({(renevue: Receita) -> Bool in
                renevue.categoria == CategoryOfRenevue.cooked.rawValue
            })
        case 3:
            filterRenevue = allrenevue.filter({(renevue: Receita) -> Bool in
                renevue.categoria == CategoryOfRenevue.frying.rawValue
            })
        case 4:
            filterRenevue = allrenevue.filter({(renevue: Receita) -> Bool in
                renevue.categoria == CategoryOfRenevue.drink.rawValue
            })
        default:
            break
        }
        tableView.reloadData()
    }
    
    // MARK: - Segmented controller action
    @IBAction func SegmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            filterRenevue = InternReceita.getAllRecepies()
        case 1:
            filterRenevue = MenuTableViewController.getRoastReceitas()
        case 2:
            filterRenevue = MenuTableViewController.getCookedReceitas()
        case 3:
            filterRenevue = MenuTableViewController.getFriedReceitas()
        case 4:
            filterRenevue = MenuTableViewController.getDrinkReceitas()
        default:
            break
        }
        
        // MARK: - Construction of segment indicator
        let numberOfSegments = CGFloat(SegmentedControlOutlet.numberOfSegments)
        let selectedIndex = CGFloat(sender.selectedSegmentIndex)
        let titlecount = CGFloat((SegmentedControlOutlet.titleForSegment(at: sender.selectedSegmentIndex)!.count))
        segmentindicator.topAnchor.constraint(equalToSystemSpacingBelow: SegmentedControlOutlet.bottomAnchor, multiplier: 0.3).isActive = true
        segmentindicator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        segmentindicator.widthAnchor.constraint(equalToConstant: CGFloat(15 + titlecount * 10)).isActive = true
        segmentindicator.centerXAnchor.constraint(equalToSystemSpacingAfter: SegmentedControlOutlet.centerXAnchor, multiplier:  numberOfSegments/CGFloat(3.0 + CGFloat(selectedIndex-1.0)*2.0)).isActive = true

        UIView.animate(withDuration: 0.5, animations: {
        self.segmentindicator.transform = CGAffineTransform(scaleX: 1.4, y: 1)
            self.view.layoutIfNeeded()

        }) { (finish) in
        UIView.animate(withDuration: 0.4, animations: {
        self.segmentindicator.transform = CGAffineTransform.identity
            self.view.layoutIfNeeded()

        })
        }
        tableView.reloadData()
    }
    
    // MARK: - Functions of segmented
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
    
    static func getDrinkReceitas() -> [Receita] {
        let all = InternReceita.getAllRecepies()
        var drinkReceitas: [Receita] = []
        for receita in all where receita.categoria == "Drink" {
            drinkReceitas.append(receita)
        }
        return drinkReceitas
    }

    // MARK: - Construction table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterRenevue.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IDMenuCell") as? CardsMenuTableViewCell {
            
            cell.imageRecipeCardMenu.image = UIImage(named: filterRenevue[indexPath.row].nomeDaImagem2)
            cell.labelNameRecipeCardMenu.text = filterRenevue[indexPath.row].nomeDaReceita
            cell.labelTimeRecipeCardMenu.text = filterRenevue[indexPath.row].tempoDePreparo
            cell.labelPeopleRecipeCardMenu.text = filterRenevue[indexPath.row].quantasPessoasServe
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recepie = filterRenevue[indexPath.row]
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipePage") as? RecipeViewController {
            
            viewController.renevue = recepie
            
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}

// MARK: - Delegate of searchBar
extension MenuTableViewController: UISearchBarDelegate {
    func creatSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Ingredientes"
        self.navigationItem.titleView = searchBar
    }
}
