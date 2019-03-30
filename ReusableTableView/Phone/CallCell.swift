//
//  CallCell.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 26/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class CallCell: UITableViewCell {
    
    var callerNameLabel: UILabel = {
        let callerNameLabel = UILabel.init(frame: .zero)
        
        callerNameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        return callerNameLabel
    }()
    
    var callModeLabel: UILabel = {
        let callModeLabel = UILabel.init(frame: .zero)
        
        callModeLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        callModeLabel.textColor = UIColor.lightGray
        
        return callModeLabel
    }()
    
    var callImageView: UIImageView = {
        let callImageView = UIImageView.init(image: UIImage.init(named: "call_outgoing")?.withRenderingMode(.alwaysTemplate))
        callImageView.tintColor = UIColor.lightGray
        
        return callImageView
    }()
    
    var callTimeLabel: UILabel = {
        let callTimeLabel = UILabel.init(frame: .zero)
        
        callTimeLabel.font = UIFont.preferredFont(forTextStyle: .callout)
        callTimeLabel.textColor = UIColor.lightGray
        
        return callTimeLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .detailButton
        
        setupCallerNameLabel()
        setupCallModeLabel()
        setupCallImageView()
        setupCallTimeLabel()
    }
    
    private func setupCallerNameLabel() {
        callerNameLabel.text = "Caller Name"
        
        callerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(callerNameLabel)
        
        NSLayoutConstraint.activate([
            callerNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 36),
            callerNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12)
            ])
        
//        NSLayoutConstraint.activate([
//
//            callerNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
//            callerNameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
//            ])
    }
    
    private func setupCallModeLabel() {
        callModeLabel.text = "Call Mode"
        
        callModeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(callModeLabel)
        
        NSLayoutConstraint.activate([
            callModeLabel.leadingAnchor.constraint(equalTo: callerNameLabel.leadingAnchor, constant: 0),
            callModeLabel.topAnchor.constraint(equalTo: callerNameLabel.bottomAnchor, constant: 2),
            callModeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            callModeLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
            ])
    }
    
    private func setupCallImageView() {
        callImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(callImageView)
        
        NSLayoutConstraint.activate([
            callImageView.centerXAnchor.constraint(equalTo: callerNameLabel.leadingAnchor, constant: -18),
            callImageView.centerYAnchor.constraint(equalTo: callerNameLabel.centerYAnchor, constant: 0),
            callImageView.heightAnchor.constraint(equalTo: callImageView.widthAnchor, constant: 0),
            callImageView.widthAnchor.constraint(equalToConstant: 16.0)
            ])
    }
    
    private func setupCallTimeLabel() {
        callTimeLabel.text = "Yesterday"
        
        callTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        callTimeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        callTimeLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        self.contentView.addSubview(callTimeLabel)
        
        NSLayoutConstraint.activate([
            callTimeLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0),
            
            callTimeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
        callTimeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: callerNameLabel.trailingAnchor)
            ])
        
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
        
        //self.setSelected(false, animated: true)
    }
}
