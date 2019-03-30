//
//  MailViewController.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class MailViewController: UIViewController, ReusableTableViewContainerProtocol {
    typealias CellModelType = Mail
    typealias TableViewCellType = MailCell
    
    var mails = mockMails
    
    ///strong reference
    var dataManager: (UITableViewDataSource & UITableViewDelegate)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationItem.title = "Mail"
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain, TableViewCellType.self)
        
        //tableView.contentInset = UIEdgeInsets.init(top: 0, left: 6, bottom: 0, right: 0)
        tableView.tableFooterView = UIView()

//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
        
        dataManager = ReusableTableViewDataManager.init(with: self, and: self)
        
        tableView.dataSource = dataManager
        tableView.delegate = dataManager
        
        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
    }
}

extension MailViewController: ReusableDataProviderProtocol {
    typealias Model = Mail
    
    var models: [Mail] {
        return mails
    }
    
}

extension MailViewController: ReusableCellDataBinderProtocol {
    typealias CellModel = CellModelType
    typealias CellType = TableViewCellType
    
    func bind(data: MailViewController.CellModelType, to cell: MailViewController.TableViewCellType) {
        cell.fromLabel.text = data.from
        cell.dateLabel.text = data.relativeDateString
        cell.subjectLabel.text = data.subject
        cell.bodyLabel.text = data.body
        
        cell.indicatorView.isHidden = !(data.unread)
    }
}


