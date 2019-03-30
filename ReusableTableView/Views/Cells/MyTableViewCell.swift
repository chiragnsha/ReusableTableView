//
//  MyTableViewCell.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit



class MyTableViewCell: UITableViewCell {
    public var myLabel : UILabel = {
       let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 44))
        
        label.font = UIFont.systemFont(ofSize: 13.0)
        label.textColor = UIColor.red
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(myLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
