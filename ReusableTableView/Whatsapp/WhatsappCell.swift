//
//  WhatsappCell.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 24/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class WhatsappCell: UITableViewCell {
//    @IBOutlet weak var chatImageView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var senderLabel: UILabel!
//    @IBOutlet weak var messageLabel: UILabel!
//    @IBOutlet weak var timeLabel: UILabel!
//    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.chatImageView.layer.cornerRadius = self.chatImageView.frame.size.width/2;
        self.chatImageView.layer.masksToBounds = true;
        self.countLabel.layer.cornerRadius = self.countLabel.frame.size.width/2;
        self.countLabel.layer.masksToBounds = true;
        
        self.separatorInset = UIEdgeInsets.init(top: 0, left: 84, bottom: 0, right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
