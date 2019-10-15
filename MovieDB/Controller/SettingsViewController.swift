//
//  ViewController.swift
//  MovieDB
//
//  Created by Павел Пономарев on 24/09/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

class SettingsViewController: UIViewController {
    
    var tableView: UITableView!
    var userHeader: UserInfoSettingsHeader!
    
    private let headerAndSectionsColor = UIColor(red: 28, green: 28, blue: 30, alpha: 0.005)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    

    func setUpTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.backgroundColor = .black
    
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.tableFooterView = UIView()
        
        let frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
        userHeader = UserInfoSettingsHeader(frame: frame)
        userHeader.backgroundColor =  UIColor(red: 28, green: 28, blue: 30, alpha: 0.005)//.darkGray
        tableView.tableHeaderView = userHeader
        
        tableView.separatorColor = .lightGray
        
    }
    
    func setUpUI() {
        setUpTableView()
       
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.title = "Settings"
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        
        switch section {
        case .UserPreferences:
            return UserPreferencesOptions.allCases.count
        case .Social:
            return SocialOptions.allCases.count
        case .Location:
            return LocationOptions.allCases.count
       
        }
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = .black
        let titleLabel = UILabel()
        header.addSubview(titleLabel)
        titleLabel.text = SettingsSection(rawValue: section)?.description
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: header.leftAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        
        return header;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        
        cell.backgroundColor = headerAndSectionsColor
        cell.textLabel?.textColor = .white
        
        switch section {
        case .UserPreferences:
            let userPrefs = UserPreferencesOptions(rawValue: indexPath.row)
            cell.sectionType = userPrefs
        case .Location:
            let location = LocationOptions(rawValue: indexPath.row)
            cell.sectionType = location
        case .Social:
            let social = SocialOptions(rawValue: indexPath.row)
            cell.sectionType = social
        }

        return cell
    }
    
    
}

