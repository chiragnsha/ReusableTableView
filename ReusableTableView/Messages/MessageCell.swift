//
//  MessageCell.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 26/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    var bubbleImageView: UIImageView = {
        let bubbleImageView = UIImageView.init()
        
        bubbleImageView.image = UIImage.init(named: "message_bubble_sent")!.resizableImage(withCapInsets:
            UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),                        resizingMode: .stretch).withRenderingMode(.alwaysTemplate)
        
        return bubbleImageView
    }()
    
    var messageLabel: UILabel = {
        let messageLabel = UILabel.init()
        
        messageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        messageLabel.textColor = UIColor.white
        messageLabel.numberOfLines = 0
        
        return messageLabel
    }()
    
    var receivedBubbleImageView: UIImageView = {
        let receivedBubbleImageView = UIImageView.init()
        
        receivedBubbleImageView.image = UIImage.init(named: "message_bubble_received")!.resizableImage(withCapInsets:
            UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),                        resizingMode: .stretch)
        
        return receivedBubbleImageView
    }()
    
    var receivedMessageLabel: UILabel = {
        let receivedMessageLabel = UILabel.init()
        
        receivedMessageLabel.font = UIFont.preferredFont(forTextStyle: .body)
        receivedMessageLabel.textColor = UIColor.black
        receivedMessageLabel.numberOfLines = 0
        
        return receivedMessageLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMessageLabel()
        setupBubbleImageView()
    
        setupReceivedMessageLabel()
        setupReceivedBubbleImageView()
        
        self.contentView.bringSubviewToFront(messageLabel)
        self.contentView.bringSubviewToFront(receivedMessageLabel)
    }
    
    private func setupMessageLabel() {
        messageLabel.text = "hi"
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        messageLabel.setContentHuggingPriority(.required, for: .vertical)
        
        //messageLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        self.contentView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            messageLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            messageLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            messageLabel.widthAnchor.constraint(lessThanOrEqualTo: self.contentView.widthAnchor, multiplier: 0.7)
            ])
    }
    
    private func setupBubbleImageView() {
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(bubbleImageView)
        
        NSLayoutConstraint.activate([
            bubbleImageView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -12),
            bubbleImageView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -6),
            bubbleImageView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 18),
            bubbleImageView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 6)
            ])
    }
    
    private func setupReceivedMessageLabel() {
        receivedMessageLabel.text = "hi"
        receivedMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        receivedMessageLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    //receivedMessageLabel.setContentHuggingPriority(.required, for: .vertical)
        //receivedMessageLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        self.contentView.addSubview(receivedMessageLabel)
        
        NSLayoutConstraint.activate([
            receivedMessageLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            receivedMessageLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            receivedMessageLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            receivedMessageLabel.widthAnchor.constraint(lessThanOrEqualTo: self.contentView.widthAnchor, multiplier: 0.7)
            ])
    }
    
    private func setupReceivedBubbleImageView() {
        receivedBubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(receivedBubbleImageView)
        
        NSLayoutConstraint.activate([
            receivedBubbleImageView.leadingAnchor.constraint(equalTo: receivedMessageLabel.leadingAnchor, constant: -18),
            receivedBubbleImageView.topAnchor.constraint(equalTo: receivedMessageLabel.topAnchor, constant: -6),
            receivedBubbleImageView.trailingAnchor.constraint(equalTo: receivedMessageLabel.trailingAnchor, constant: 12),
            receivedBubbleImageView.bottomAnchor.constraint(equalTo: receivedMessageLabel.bottomAnchor, constant: 6)
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
    }
    
    override var intrinsicContentSize: CGSize {
    
        return super.intrinsicContentSize
    }
    
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        return super.systemLayoutSizeFitting(targetSize)
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        
        //self.contentView.layoutIfNeeded()
        //messageLabel.preferredMaxLayoutWidth = messageLabel.frame.width
        
        return super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    override func needsUpdateConstraints() -> Bool {
//        messageLabel.text = "123345"
        return super.needsUpdateConstraints()
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.setNeedsLayout()
        self.contentView.layoutIfNeeded()
        messageLabel.preferredMaxLayoutWidth = messageLabel.frame.width
        receivedMessageLabel.preferredMaxLayoutWidth = receivedMessageLabel.frame.width
        
        super.layoutSubviews()
        print("layout subview..")
    }
}
