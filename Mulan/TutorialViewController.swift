//
//  Tutoriais.swift
//  Mulan
//
//  Created by Nathalia Melare on 09/05/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//
import Foundation
import UIKit


class TutorialViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)

    
    var tutorial: [Dica] = []
    
    var filterdicas: [Dica] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .init(red: 157/255, green: 20/255, blue: 28/255, alpha: 1)
        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Pesquisar dica"
        searchController.searchBar.placeholder = NSLocalizedString("Search Tips", comment: "PlaceHolder dos tutoriais")
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        tutorial = InternDica.getAllTutoriall()
        tabBarController?.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering(){
            return filterdicas.count
        }
        return tutorial.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if let cell = tableView.dequeueReusableCell(withIdentifier: "tutorialCellCard") as? TutorialCellCards {
               
                if isFiltering(){
                    cell.tutorialCellCard.image = UIImage(named: filterdicas[indexPath.row].nomedaimagem)
                } else {
                    cell.tutorialCellCard.image = UIImage(named: tutorial[indexPath.row].nomedaimagem)
                    
                }
                return cell
                
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tutorials = tutorial[indexPath.row]
        if isFiltering(){
            tutorials = filterdicas[indexPath.row]
        }
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaginaTutorial") as? PaginaTutorialViewController {
            viewController.dicas = tutorials
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }

    func filterContentForSearchText(_ searchText: String) {
//        filterdicas = tutorial.filter({( recepie : Dica) -> Bool in
//            for dica in tutorial.palavraschave {
//                if dica.lowercased().contains(searchText.lowercased()){
//                    return true
//                }
//            }
//
//            return false
//        })
        
//        fazer negocio do botao nessa parte (dica do app ferias)
        filterdicas = tutorial.filter({ (umaDica : Dica) -> Bool in
            for palavrachave in umaDica.palavraschave{
                if palavrachave.lowercased().contains(searchText.lowercased()){
                    return true
                }
            }
            return false
        })
        
        tableView.reloadData()
    }

    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    }

extension TutorialViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

