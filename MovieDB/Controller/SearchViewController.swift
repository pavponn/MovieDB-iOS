//
//  SearchViewController.swift
//  MovieDB
//
//  Created by Павел Пономарев on 18/10/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit
class SearchViewController: UIViewController {
    
    var tableView: UITableView!
    var searchVIew: UIView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navigationItem.title = "Search"
        tabBarItem.title = "Search"
        if #available(iOS 13.0, *) {
            tabBarItem.image = UIImage(systemName: "magnifyingglass")
        } else {
            // Fallback on earlier versions
        }
    }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationItem.title = "Search"
        
        tabBarItem.title = "Search"
        if #available(iOS 13.0, *) {
            tabBarItem.image = UIImage(systemName: "magnifyingglass")
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func loadView() {
    }
    
}


extension SearchViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
}
