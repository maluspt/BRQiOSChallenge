//
//  ViewController.swift
//  challange02
//
//  Created by Maria Luiza Carvalho Sperotto on 09/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    var movies = [Movie]()
    let searchController = UISearchController(searchResultsController: nil)
    let key = "c3727820"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.obscuresBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchBar: searchController.searchBar)
    }
    
    func filterSearchController(searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        let search = searchText.replacingOccurrences(of: " ", with: "+")
        let resourceString = "https://api.themoviedb.org/3/search/movie?api_key=b3d6e6a780ecfa9d43bfe35c6e19a32c&query=\(search)"

        print(resourceString)
        if let url = URL(string: resourceString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonMovies = try? decoder.decode(Movies.self, from: json) {
            movies = jsonMovies.results
            tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie", for: indexPath)
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }
    
    


}

