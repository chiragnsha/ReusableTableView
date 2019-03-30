//
//  ReusableTableView.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 21/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class ReusableTableView<Cell: UITableViewCell>: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(Cell.self, forCellReuseIdentifier: NSStringFromClass(Cell.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        super.register(nib, forCellReuseIdentifier: NSStringFromClass(Cell.self))
    }
}

///or use following custom initiliazer for tableview..
extension UITableView {
    convenience init<Cell: UITableViewCell>(frame: CGRect, style: UITableView.Style, _ CellType: Cell.Type) {
        self.init(frame: frame, style: style)
        self.register(Cell.self, forCellReuseIdentifier: NSStringFromClass(Cell.self))
    }
}
