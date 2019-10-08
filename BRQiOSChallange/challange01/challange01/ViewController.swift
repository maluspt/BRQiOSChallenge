//
//  ViewController.swift
//  challange01
//
//  Created by Maria Luiza Carvalho Sperotto on 05/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    
    var bands = Band.getBands()
    var selectedBand: Band?
    var filteredBands: [Band] = []
    let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "favorite bands"
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchBar: searchController.searchBar)
        
        /*guard let text = searchController.searchBar.text else { return }
        filteredBands = bands
        if text.isEmpty == false {
            filteredBands = bands.filter { $0.name.contains(text)}
        }
        tableView.reloadData()
        
        print(text)*/
    }
    
    func filterSearchController(searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        filteredBands = bands.filter { $0.name.contains(searchText)
            
        }
        tableView.reloadData()
    }
    
   /* func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredBands = bands
        
        if searchText.isEmpty == false {
            filteredBands = bands.filter { $0.name.contains(searchText)}
        }
        tableView.reloadData()
        
    }*/
    
    
    // table functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredBands.count
            }
        return bands.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Band", for: indexPath) as! BandTableViewCell
        var band = bands[indexPath.row]
        cell.band = band
        if searchController.isActive {
            band = filteredBands[indexPath.row]
        } else {
            band = bands[indexPath.row]
        }
         
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let band = bands[indexPath.row]
        selectedBand = band
        performSegue(withIdentifier: "Detail", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            let bandDetail = segue.destination as! DetailTableViewController
            bandDetail.band = selectedBand
        }
    }
    
    
    
}

