//
//  SettingsSection.swift
//  MovieDB
//
//  Created by Павел Пономарев on 15/10/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

protocol SectionType: CustomStringConvertible {
    var containsToogler: Bool { get }
    
    var containsDisclosureIndicator: Bool { get }
    
    var containsCheckMark:Bool { get }
    
    var pushedView: UIViewController? { get }
}


enum SettingsSection: Int, CustomStringConvertible, CaseIterable {
    case UserPreferences
    case Location
    case Social
    
    var description: String {
        switch self {
        case .UserPreferences:
            return "User preferences"
        case .Location:
            return "Location"
        case .Social:
            return "Social"
        }
    }
    
    var containsToogler: Bool {
        return false
    }
    
    var containsMore: Bool {
        return false
    }
    
    var containsCheckMark: Bool {
        return false
    }
}


enum UserPreferencesOptions: Int, CaseIterable, SectionType {
    case EditInfo
    case LogOut
    
    var description: String {
        switch self {
        case .EditInfo:
            return "Edit info"
        case .LogOut:
            return "Log out"
        }
    }
    
    var containsToogler: Bool {
        return false
    }
    
    var containsDisclosureIndicator: Bool {
        return true
    }
    
    var containsCheckMark: Bool {
        return false
    }
    
    var pushedView: UIViewController? {
        return nil // TODO add view
    }
}

enum LocationOptions: Int, CaseIterable, SectionType {
    case Country
    case Language
    
    var description: String {
        switch self {
        case .Country:
            return "Country"
        case .Language:
            return "Language"
        }
    }
    
    var containsToogler: Bool {
        return false
    }
    
    var containsDisclosureIndicator: Bool {
        return true
    }
    
    var containsCheckMark: Bool {
        return false
    }
    
    var pushedView: UIViewController? {
        switch self {
        case .Country:
            return CountryChooseViewController()
        case .Language:
            return LanguageChooseViewController()
        }
    }

}

enum SocialOptions: Int, CaseIterable, SectionType {
    case PushNotifications
    case EmailNotifications
    
    var description: String {
        switch self {
        case .PushNotifications:
            return "Push notifications"
        case .EmailNotifications:
            return "Email notifications"
        }
    }
    
    var containsToogler: Bool {
        switch self {
        case .PushNotifications:
            return true
        case .EmailNotifications:
            return true
        }
    }
    
    var containsDisclosureIndicator: Bool {
        return false
    }
    
    var containsCheckMark: Bool {
        return false
    }
    
    var pushedView: UIViewController? {
        return nil
    }
}

