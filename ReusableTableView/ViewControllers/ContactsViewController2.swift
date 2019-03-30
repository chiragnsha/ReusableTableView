//
//  FirstTableViewController.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class ContactsViewController1: UIViewController, ReusableTableViewContainerProtocol {
    typealias CellModelType = Form
    typealias TableViewCellType = MyTableViewCell
    
    var tableView: UITableView
    var dataSourceManager: (UITableViewDataSource & UITableViewDelegate)?
    
    init() {
//        self.tableView = UITableView.init(frame: CGRect.zero, style: .plain, Cell.self)
        
   //     self.tableView = ReusableTableView<FirstCellType>.init(frame: CGRect.zero, style: .plain)
        
        self.tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        
        super.init(nibName: nil, bundle: nil)
        
        self.dataSourceManager = ReusableTableViewDataManager<ContactsViewController1, ContactsViewController1>.init(with: self, and: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.view.backgroundColor = UIColor.darkGray
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        ///setup TV constraints
        
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        if let dataSourceManager = dataSourceManager {
            tableView.dataSource = dataSourceManager
            tableView.delegate = dataSourceManager
        }
    }
}

extension ContactsViewController1: ReusableDataProviderProtocol {
//    typealias Model = String
//
//    var models: [String] {
//        return [ "abc", "def" ,"ghi"]
//    }

    typealias Model = Form
    
    var models: [Form] {
        return [ Form.init(formName: "test"), Form.init(formName: "test1"), Form.init(formName: "test2"), Form.init(formName: "test3"), Form.init(formName: "test4"),]
    }
}

extension ContactsViewController1: ReusableCellDataBinderProtocol {
    typealias CellModel = Form
    typealias CellType = TableViewCellType
    
    func bind(data: Form, to cell: MyTableViewCell) {
        cell.backgroundColor = UIColor.magenta.withAlphaComponent(0.2)
        cell.myLabel.text = data.formName
    }
    
}

class Form {
    var formName: String
    
    init(formName: String) {
        self.formName = formName
    }
}
