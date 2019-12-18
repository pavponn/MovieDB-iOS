//
//  CountryChooseViewController.swift
//  MovieDB
//
//  Created by Павел Пономарев on 22.10.2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CountryCell"

class CountryChooseViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private var countriesArray = ["Russia", "USA", "England", "Italy", "Spain", "France", "Australia"] // TODO: get list of countries from API
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUpItems()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpItems()
    }
    
    private func setUpItems() {
        navigationItem.title = "Country"
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func loadView() {
        setUpUI()
    }
    
    func setUpUI() {
        tableView = UITableView()
        view = tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.backgroundColor = .black
        
        tableView.register(SettingsCountryCell.self, forCellReuseIdentifier: SettingsCountryCell.reuseIdentifier)
        
        tableView.tableFooterView = UIView()
    }
}

extension CountryChooseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // TODO
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countriesArray[indexPath.row]
        let  cell = tableView.dequeueReusableCell(withIdentifier: SettingsCountryCell.reuseIdentifier, for: indexPath) as! SettingsCountryCell
        
        cell.backgroundColor = ViewConstants.APP_SECOND_COLOR
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = country

        return cell
    }
}


