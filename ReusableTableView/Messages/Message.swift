//
//  Message.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 26/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation

public enum MessageType {
    case sent
    case received
}

struct Message {
    var message: String
    var type: MessageType
//    
//    init() {
//        message = "asdsdasdasdksa  ad"
//        type = .sent
//    }
}

extension Message: Decodable {
    public enum CodingKeys: String, CodingKey {
        case message
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? "emptyy message Hello 123 13 1231Hello 123 13 12312Hello 123 13 12312Hello 123 13 12312Hello 123 13 12312"
//        self.message = "Hello 123 13 12312"
//        self.message = try container.decode(String.self, forKey: .message)
        self.type = .sent
    }
}
