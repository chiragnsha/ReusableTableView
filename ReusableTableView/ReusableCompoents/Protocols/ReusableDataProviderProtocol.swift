//
//  ReusableDataProviderProtocol.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation

protocol ReusableDataProviderProtocol: class {
    associatedtype Model
    
    var models: [Model] { get }
}
