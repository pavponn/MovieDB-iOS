//
//  SearchViewController.swift
//  MovieDB
//
//  Created by Павел Пономарев on 18/10/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit
class SearchViewController: UIViewController {
    
    private var tableView: UITableView!
    private var searchController: UISearchController!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        searchController = UISearchController(searchResultsController: nil)
        itemsSetUp()
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        searchController = UISearchController(searchResultsController: nil)
        itemsSetUp()
    }
    
    override func loadView() {
         setUpUI()
    }
    
    func setUpUI() {
        setUpTableView()
        setUpSearchController()
    }
    
    func setUpTableView() {
        tableView = UITableView()
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.backgroundColor = ViewConstants.APP_SECOND_COLOR
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseIdentifier)
        
        tableView.tableFooterView = UIView()
    }
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Movies, series, cartoons, etc"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func itemsSetUp() {
        navigationItem.title = "Search"
        tabBarItem.title = "Search"
        if #available(iOS 13.0, *) {
            tabBarItem.image = UIImage(systemName: "magnifyingglass")
        } else {
            // Fallback on earlier versions
        }
    }
    
}
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14;
    }
       
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        cell.backgroundColor = ViewConstants.APP_SECOND_COLOR
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        // TODO
    }
    
}
