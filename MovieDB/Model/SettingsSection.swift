//
//  SettingsSection.swift
//  MovieDB
//
//  Created by Павел Пономарев on 15/10/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

protocol SectionType: CustomStringConvertible {
    var containsToogler: Bool { get }
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
}

