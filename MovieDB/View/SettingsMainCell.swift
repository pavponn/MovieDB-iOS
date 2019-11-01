//
//  SettingsCell.swift
//  MovieDB
//
//  Created by Павел Пономарев on 08/10/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

class SettingsMainCell: UITableViewCell {
    
    public static var reuseIdentifier: String {
           return "SettingsMainCellReuseIdentifier"
    }
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType.self else { return }
            textLabel?.text = sectionType.description
            toogler.isHidden = !sectionType.containsToogler
            self.selectionStyle = sectionType.containsToogler ? .none : .gray
            if sectionType.containsDisclosureIndicator {
                self.accessoryType = .disclosureIndicator
            }
            
        }
    }
    
    lazy var toogler: UISwitch = {
        let toogler = UISwitch()
        toogler.isOn = true
        toogler.onTintColor = .systemGreen
        toogler.translatesAutoresizingMaskIntoConstraints = false
        toogler.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return toogler
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(toogler)
        toogler.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        toogler.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSwitchAction(sender: UISwitch) {
        if sender.isOn {
            print("Turned on")
        } else {
            print("Turned off")
        }
    }
    
}
