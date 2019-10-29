//
//  ViewController.swift
//  MovieDB
//
//  Created by Павел Пономарев on 24/09/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    private var tableView: UITableView!
    private var userHeader: UserInfoSettingsHeader!
    
    private let headerAndCellsColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        itemsSetUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        itemsSetUp()
    }
    
    private func itemsSetUp() {
        navigationItem.title = "Settings"
        tabBarItem.title = "Settings"
        if #available(iOS 13.0, *) {
            tabBarItem.image = UIImage(systemName: "gear")
        } else {
            // Fallback on earlier versions
        }
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
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifier)
        
        tableView.tableFooterView = UIView()
               
        let frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
        userHeader = UserInfoSettingsHeader(frame: frame)
        userHeader.backgroundColor = headerAndCellsColor
        tableView.tableHeaderView = userHeader
    }

}
extension SettingsViewController: UITableViewDelegate {
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           
           guard let section = SettingsSection(rawValue: indexPath.section) else { return }
           

           var viewToPush: UIViewController?
           
           switch section {
           case .Social:
               viewToPush = SocialOptions(rawValue: indexPath.row)?.pushedView
           case .UserPreferences:
               viewToPush = UserPreferencesOptions(rawValue: indexPath.row)?.pushedView
           case .Location:
               viewToPush = LocationOptions(rawValue: indexPath.row)?.pushedView
           }
           
           if (viewToPush != nil) {
               navigationController?.pushViewController(viewToPush!, animated: true)
           }
       
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
           let header = UITableViewHeaderFooterView()
           header.backgroundColor = .black
           header.tintColor = .black
           header.textLabel?.text = SettingsSection(rawValue: section)?.description
           header.textLabel?.textColor = .white
           
           header.textLabel?.font = .boldSystemFont(ofSize: 18)
           header.textLabel?.translatesAutoresizingMaskIntoConstraints = false
           
           return header;
       }
       
       func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 40
       }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
             return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as! SettingsCell
        
        cell.backgroundColor = headerAndCellsColor
        cell.accessoryView?.tintColor = .white
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

