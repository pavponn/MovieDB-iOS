//
//  SettingsCountryCell.swift
//  MovieDB
//
//  Created by Павел Пономарев on 01.11.2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

class SettingsCountryCell: UITableViewCell {
    
    public static var reuseIdentifier: String {
        return "SettingsCountryCell";
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
