//
//  ReusableDataBinderProtocol.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableCellDataBinderProtocol: class {
    associatedtype CellModel
    associatedtype CellType: UITableViewCell
    
    func bind(data: CellModel, to cell: CellType)
}
