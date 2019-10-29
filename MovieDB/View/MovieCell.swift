//
//  MovieCell.swift
//  MovieDB
//
//  Created by Павел Пономарев on 29.10.2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var reuseIdentifier: String {
        return "MovieCellReuseIdentifier"
    }
}
