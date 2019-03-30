//
//  Contact.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 26/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation

struct Call {
    var name: String
    
    var callType: String
    var callTime: Date
    
    var isMissed: Bool
    
    init() {
        name = "test"
        callType = "test"
        callTime = Calendar.now(addingDays: 2)
        isMissed = Bool.random()
    }
    
    var relativeDateString: String {
        if Calendar.current.isDateInToday(callTime) {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: callTime)
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.doesRelativeDateFormatting = true
            return formatter.string(from: callTime)
        }
    }
}

extension Call: Decodable {
    public enum CodingKeys: String, CodingKey {
        case name
        case callType
        case callTime
        case isMissed
    }
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.callType = try container.decode(String.self, forKey: .callType)
        
        let callTimeDays = try container.decode(Int.self, forKey: .callTime)
        self.callTime = Calendar.now(addingDays: callTimeDays)
        
        self.isMissed = try container.decode(Bool.self, forKey: .isMissed)
        
    }
}
