//
//  ViewConstants.swift
//  MovieDB
//
//  Created by Павел Пономарев on 20.11.2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit


class ViewConstants {
    
    public static let APP_MAIN_COLOR = UIColor(red: 2.0 / 255.0, green: 22.0 / 255.0, blue: 31.0 / 255.0, alpha: 1.0)
    
    public static let APP_SECOND_COLOR = APP_MAIN_COLOR.darker(by: 3.5);
    
    public static let MAIN_FONT_COLOR = UIColor(red: 49.0 / 255.0, green: 212.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0)
    
    public static let MAIN_LARGE_FONT = UIFont(name: "Town10Display-Bold", size: 36.0)
    
    public static let MAIN_REGULAR_FONT = UIFont(name: "Town10Display-Bold", size: 16.0)
    
}


extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
