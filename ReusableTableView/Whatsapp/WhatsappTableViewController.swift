//
//  WhtasappTableViewController.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 24/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class WhatsappTableViewController: UITableViewController, ReusableTableViewContainerProtocol {
    typealias CellModelType = WhatsappChat
    typealias TableViewCellType = WhatsappCell
    
    var dataManager: (UITableViewDataSource & UITableViewDelegate)?
    var chats: [CellModelType] = {
//        return (0..<(Int.random(in: 7..<15))).map({ (value) -> WhatsappChat in
//            return WhatsappChat.init()
//        })
        
        do {
            let whatsappChats = try JSONDecoder.init().decode([WhatsappChat].self, from: API.whatsapp.sampleData)
            return whatsappChats
        } catch {
            return []
        }
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return super.awakeAfter(using: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
//        self.extendedLayoutIncludesOpaqueBars = false;
//        self.automaticallyAdjustsScrollViewInsets = false;
        
        self.navigationItem.title = "Whatsapp"
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
//        self.edgesForExtendedLayout = []
        
        
         self.tableView.register(UINib.init(nibName: "WhatsappCellXIB", bundle: nil), forCellReuseIdentifier: NSStringFromClass(TableViewCellType.self))
        
        self.dataManager = ReusableTableViewDataManager.init(with: self, and: self)
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self.dataManager
        self.tableView.delegate = self.dataManager
        //self.tableView.dataSource = self.dataManager
       
        
        self.tableView.tableFooterView = UIView()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "WhatsappCell") else {
            return tableView.dequeueReusableCell(withIdentifier: "WhatsappCell", for: indexPath)
        }
        
        return tableViewCell
    }
    
}

extension WhatsappTableViewController: ReusableDataProviderProtocol {
    typealias Model = CellModelType
    var models: [WhatsappTableViewController.CellModelType] {
        return chats
    }
}

extension WhatsappTableViewController: ReusableCellDataBinderProtocol {
    typealias CellModel = CellModelType
    typealias CellType = TableViewCellType
    
    func bind(data: WhatsappTableViewController.CellModelType, to cell: WhatsappTableViewController.TableViewCellType) {
        cell.nameLabel.text = data.name
        cell.senderLabel.text = data.sender
        cell.messageLabel.text = data.message
        
        cell.timeLabel.text = data.relativeDateString
        cell.countLabel.text = String(data.count)
        
        if data.unread {
            cell.timeLabel.textColor = cell.tintColor
            cell.countLabel.backgroundColor = cell.tintColor
        } else {
            cell.timeLabel.textColor = UIColor.lightGray
            cell.countLabel.isHidden = true
//            cell.countLabel.backgroundColor = UIColor.clear
        }
        
        guard let imageURL = URL.init(string: "https://randomuser.me/api/portraits/med/" + (Bool.random() ? "men" : "women") + "/" + String.init(Int.random(in: 0..<99)) + ".jpg") else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            print(response.statusCode)
            
            DispatchQueue.main.async {
                cell.chatImageView.image = UIImage.init(data: data!)
            }
        }.resume()
    }
}
