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
       }
       
       required init?(coder: NSCoder) {
           super.init(coder: coder)
            navigationItem.title = "Search"
       }
    
    override func loadView() {
    }
    
    func setUpUI() {
    
    }
    
}
