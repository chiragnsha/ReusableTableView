//
//  ReusableTableViewContainerProtocol.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableTableViewContainerProtocol {
    associatedtype CellModelType
    associatedtype TableViewCellType: UITableViewCell
}
