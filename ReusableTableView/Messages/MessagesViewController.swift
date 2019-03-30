//
//  MessagesViewController.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class MessagesDataProvider: ReusableDataProviderProtocol {
    typealias Model = Message
    var models: [Model] = {
        do {
            return try JSONDecoder.init().decode([Message].self, from: API.messages.sampleData).enumerated().map({ (offset, message) -> Message in
                
                if(offset % 2 != 0) {
                    let newMessage = Message.init(message: message.message, type: .received)
                    return newMessage
                }
                
                return message
            })
        } catch {
            return []
        }
    }()
    
}

class MessagesDataBinder: ReusableCellDataBinderProtocol {
    typealias CellModel = Message
    typealias CellType = MessageCell
    
    func bind(data: Message, to cell: MessageCell) {
        switch data.type {
        case .sent:
            cell.messageLabel.isHidden = false
            cell.messageLabel.text = data.message
            cell.bubbleImageView.isHidden = false
            
            cell.receivedMessageLabel.isHidden = true
            cell.receivedBubbleImageView.isHidden = true
            
            break
        case .received:
            cell.messageLabel.isHidden = true
            cell.bubbleImageView.isHidden = true
            
            cell.receivedMessageLabel.isHidden = false
            cell.receivedMessageLabel.text = data.message
            cell.receivedBubbleImageView.isHidden = false
            
            break
        }
    }
}

class MessagesViewController: UIViewController {
    var messageViewDataManager: ReusableTableViewDataManager<MessagesDataProvider, MessagesDataBinder>
    
    var messagesTableView: UITableView
    
    init() {
        messageViewDataManager = ReusableTableViewDataManager.init(with: MessagesDataProvider.init(), and: MessagesDataBinder.init())
        messagesTableView = ReusableTableView.init(frame: .zero, style: .plain)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.edgesForExtendedLayout = []
        self.navigationItem.title = "Messages"
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        setupMessageTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        messagesTableView.performBatchUpdates({
            
        }, completion: nil)
    }
    
    private func setupMessageTableView() {
        messagesTableView.translatesAutoresizingMaskIntoConstraints = false
        messagesTableView.tableFooterView = UIView()
        messagesTableView.separatorStyle = .none
        
        self.view.addSubview(messagesTableView)
        
        NSLayoutConstraint.activate([
           messagesTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
           messagesTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
           messagesTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
           messagesTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        messagesTableView.dataSource = messageViewDataManager
        messagesTableView.delegate = messageViewDataManager
        
    }
}
