//
//  App.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 28/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation

struct AppContainer {
    var apps: [App]
}

extension AppContainer: Decodable {
    public enum CodingKeys: String, CodingKey {
        case content
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.apps = try container.decode([App].self, forKey: .content)
    }
}

struct App {
    var appName: String
    var appDesc: String
    var appID: Int
    var appCategory: String
    var appPrice: Int
    var appPhoto: String
    
    var appRating: Double
    var in_apps: Bool
}

extension App: Decodable {
    public enum CodingKeys: String, CodingKey {
        case title
        case developer
        case icon
        case id
        case price
        case rating
        case in_apps
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        appName = try container.decode(String.self, forKey: .title)
        appDesc = try container.decode(String.self, forKey: .developer)
        appPhoto = try container.decode(String.self, forKey: .icon)
        appID = try container.decode(Int.self, forKey: .id)
        appCategory = try container.decode(String.self, forKey: .price)
        appRating = try container.decode(Double.self, forKey: .rating)
        
        appPrice = try container.decode(Int.self, forKey: .id)
        in_apps = try container.decode(Bool.self, forKey: .in_apps)
        
    }
}
