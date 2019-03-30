//
//  MailCell.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class CircleView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        self.tintColor.setFill()
        
        if let context = context {
//            CGContextFillEllipseInRect(context, rect)
            context.fillEllipse(in: rect)
        }
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        self.setNeedsDisplay()
    }
}

class MailCell: UITableViewCell {
    
    var indicatorView: CircleView = {
       let circleView = CircleView.init(frame: CGRect.zero)
        circleView.backgroundColor = UIColor.clear
        
        return circleView
    }()
    
    var fromLabel: UILabel = {
        var fromLabel = UILabel.init()
        
        fromLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        fromLabel.textColor = UIColor.darkText
        fromLabel.numberOfLines = 1
        fromLabel.text = "From: "
        fromLabel.baselineAdjustment = .alignBaselines
        
        return fromLabel
    }()
    
    var dateLabel: UILabel = {
        var dateLabel = UILabel.init()
        
        dateLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        dateLabel.textColor = UIColor.lightGray
        dateLabel.text = "Date: "
        
        return dateLabel
    }()
    
    var disclosureImageView = UIImageView.init(image: UIImage.init(named: "mail_disclosure"))
    
    var subjectLabel: UILabel = {
        var subjectLabel = UILabel.init()
        
        subjectLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subjectLabel.textColor = UIColor.darkText
        subjectLabel.numberOfLines = 1
        subjectLabel.text = "Subject:"
        
        return subjectLabel
    }()
    
    var bodyLabel: UILabel = {
        var bodyLabel = UILabel.init()
        
        bodyLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        bodyLabel.textColor = UIColor.lightGray
        bodyLabel.numberOfLines = 4
        bodyLabel.text = "Body: \n \n \n \n"
        
        return bodyLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.separatorInset = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 0)
        
        setupFromLabel()
        setupDateLabel()
        setupDisclosureImageView()
        setupSubjectLabel()
        setupBodyLabel()

        setupIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupFromLabel() {
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fromLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        fromLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        self.contentView.addSubview(fromLabel)
        
        NSLayoutConstraint.activate([
            fromLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor, constant: 9),
            fromLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8)
            ])
    }

    private func setupDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        dateLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        self.contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: fromLabel.trailingAnchor, constant: 6),
            dateLabel.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor)
            ])
    }
    
    func setupDisclosureImageView() {
        disclosureImageView.translatesAutoresizingMaskIntoConstraints = false
        disclosureImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        //disclosureImageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        self.contentView.addSubview(disclosureImageView)
        
        NSLayoutConstraint.activate([
            disclosureImageView.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 6),
            
            disclosureImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            disclosureImageView.heightAnchor.constraint(equalTo: disclosureImageView.widthAnchor),
            disclosureImageView.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor)
            ])
    }
    
    func setupSubjectLabel() {
        subjectLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subjectLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        subjectLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        self.contentView.addSubview(subjectLabel)
        
        NSLayoutConstraint.activate([
            subjectLabel.leadingAnchor.constraint(equalTo: fromLabel.leadingAnchor),
            subjectLabel.topAnchor.constraint(equalTo: fromLabel.bottomAnchor, constant: 2),
            subjectLabel.trailingAnchor.constraint(equalTo: disclosureImageView.centerXAnchor)
            ])
    }
    
    func setupBodyLabel() {
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false

//        bodyLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        bodyLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        
        self.contentView.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            bodyLabel.leadingAnchor.constraint(equalTo: fromLabel.leadingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: subjectLabel.bottomAnchor, constant: 2),
            bodyLabel.trailingAnchor.constraint(equalTo: disclosureImageView.leadingAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
            ])
    }
    
    func setupIndicatorView() {
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.indicatorView.tintColor = self.tintColor
        
        self.contentView.addSubview(indicatorView)
        
        let size: CGFloat = 12.0
        NSLayoutConstraint.activate([
            indicatorView.rightAnchor.constraint(equalTo: fromLabel.leftAnchor, constant: -6),
            
            indicatorView.widthAnchor.constraint(equalToConstant: size),
            indicatorView.heightAnchor.constraint(equalTo: indicatorView.widthAnchor),
            indicatorView.centerYAnchor.constraint(equalTo: fromLabel.centerYAnchor),
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.layoutIfNeeded()
//        subjectLabel.preferredMaxLayoutWidth = subjectLabel.frame.width
        bodyLabel.preferredMaxLayoutWidth = bodyLabel.frame.width
        
        super.layoutSubviews()
        print("layout subview..")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        let returnSize = super.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
        
        return returnSize
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        let returnsize = super.systemLayoutSizeFitting(targetSize)
        
        return returnsize
    }
}
