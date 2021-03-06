//
//  LanguageChooseViewController.swift
//  MovieDB
//
//  Created by Павел Пономарев on 22.10.2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "LanguageCell"

class LanguageChooseViewController: UIViewController {
    
    private var tableView: UITableView!
    
    private var languagesArray = ["Russian", "English"]
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
           setUpItems()
       }
       
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpItems()
    }
       
    private func setUpItems() {
        navigationItem.title = "Language"
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
           
        tableView.register(SettingsLanguageCell.self, forCellReuseIdentifier: SettingsLanguageCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
    }
    
}


extension LanguageChooseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // TODO
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let language = languagesArray[indexPath.row]
        let  cell = tableView.dequeueReusableCell(withIdentifier: SettingsLanguageCell.reuseIdentifier, for: indexPath) as! SettingsLanguageCell
        
        cell.backgroundColor = ViewConstants.APP_SECOND_COLOR
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = language
        
        return cell
    }
}
