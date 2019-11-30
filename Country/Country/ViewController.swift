//
//  ViewController.swift
//  Country
//
//  Created by Александр Звездай on 30.11.2019.
//  Copyright © 2019 Александр Звездай. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    let urlString: URL = URL(string: "https://restcountries.eu/rest/v2/")!
    
    var countries: [Country] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCountry: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Введите название страны"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        setupTableView()
        setupSearchBar()
        NetworkingClient.execute(urlString) { (country, error) in
            DispatchQueue.main.async {
                self.countries = country ?? []
                self.table.reloadData()
            }
        }
    }
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
        return filteredCountry.count
    }
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let country: Country
        
        if isFiltering() {
            country = filteredCountry[indexPath.row]
        } else {
            country = countries[indexPath.row]
        }
        
        cell.textLabel!.text = country.name
        cell.textLabel?.text = countries[indexPath.row].name
        return cell
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
}

extension ViewController {
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }

    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
    }
}
