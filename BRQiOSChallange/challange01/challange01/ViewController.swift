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
        searchController.obscuresBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        filteredBands = bands
        
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchBar: searchController.searchBar)
        

    }
    
    func filterSearchController(searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        
        filteredBands = bands.filter { $0.name.lowercased().range(of: searchText, options: .caseInsensitive) != nil}
        
        tableView.reloadData()
        
            
            }
        
    // table functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredBands.count
            }
        return bands.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Band", for: indexPath) as! BandTableViewCell
        cell.band = bands[indexPath.row]
        if searchController.isActive {
            cell.band = filteredBands[indexPath.row]
        } else {
            cell.band = bands[indexPath.row]
        }
         
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
        let band = filteredBands[indexPath.row]
        selectedBand = band
            performSegue(withIdentifier: "Detail", sender: nil) }
        else {
            let band = bands[indexPath.row]
            selectedBand = band
            performSegue(withIdentifier: "Detail", sender: nil)
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail" {
            let bandDetail = segue.destination as! DetailTableViewController
            bandDetail.band = selectedBand
        }
    }
    
    
    
}
