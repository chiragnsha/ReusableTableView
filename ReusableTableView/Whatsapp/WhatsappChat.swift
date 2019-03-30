//
//  WhatsappChat.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 24/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation

struct WhatsappChat {
    let name: String
    let sender: String
    let message: String
    let date: Date
    let count: Int
    
    var unread: Bool = false
    
    init() {
        name = "Test"
        sender = "Test"
        message = "Test"
        date = Calendar.now(addingDays: 0)
        count = 12
        
        if(Bool.random()) {
            unread = Bool.random()
        }
    }
    
    var relativeDateString: String {
        if Calendar.current.isDateInToday(date) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: date)
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.doesRelativeDateFormatting = true
            return formatter.string(from: date)
        }
    }
}

extension WhatsappChat: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case phone
        case message
        case days
        case count
        case isActive
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.sender = try container.decode(String.self, forKey: .phone)
        self.message = try container.decode(String.self, forKey: .message)
        self.date = Calendar.now(addingDays: try container.decode(Int.self, forKey: .days))
        self.count = try container.decode(Int.self, forKey: .count)
        self.unread = try container.decode(Bool.self, forKey: .isActive)
    }
}
