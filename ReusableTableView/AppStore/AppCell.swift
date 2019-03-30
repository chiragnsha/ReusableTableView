//
//  AppCell.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 28/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {
    
    var appImageView: UIImageView = {
       let appImageView = UIImageView.init()
        
        appImageView.contentMode = .scaleToFill
        appImageView.layer.cornerRadius = 12
        appImageView.clipsToBounds = true
        
        return appImageView
    }()
    
    var appNameLabel: UILabel = {
        let appNameLabel = UILabel.init()
        
        appNameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        return appNameLabel
    }()
    
    var appSubLabel: UILabel = {
        let appSubLabel = UILabel.init()
        
        appSubLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        appSubLabel.textColor = UIColor.lightGray
        
        return appSubLabel
    }()
    
    var appLabelStackView: UIStackView = {
        let stackView = UIStackView.init()
        
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 3.0
        
        return stackView
    }()
    
    var inAppText : UILabel = {
        let lightGray = UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = lightGray
        label.numberOfLines = 1
        label.text =  "In-App Purchases"
        
        return label
    }()
    
    var getBtn : UIButton = {
        let lightGray = UIColor(red: 239/255.0, green:239/255.0, blue:244/255.0, alpha: 1)
        let headerBlue = UIColor(red: 136/255, green: 190/255, blue: 249/255, alpha: 1)
        
//        let backGroundImage = UIImage(color: lightGray, scale: CGSize(width: 20, height: 10))
        
        let btn = UIButton()
        
        btn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: -1, right: 0)
        
        let attributedString = NSMutableAttributedString(string: "GET".uppercased(), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0, weight: .bold),                            NSAttributedString.Key.foregroundColor: btn.tintColor])
        btn.setAttributedTitle(attributedString, for: .normal)
//        btn.setBackgroundImage(backGroundImage, for: .normal)
        
        btn.backgroundColor = lightGray
        btn.layer.cornerRadius = 14
        btn.clipsToBounds = true
        btn.setTitle("GET".uppercased(), for: .normal)
        
        //btn.setTitleColor(btn.tintColor, for: .normal)
        
        return btn
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.preservesSuperviewLayoutMargins = true
        self.contentView.preservesSuperviewLayoutMargins = true
        self.separatorInset = UIEdgeInsets.init(top: 0, left: 94, bottom: 0, right: 0)
        
        
        setupAppImageView()
        setupAppLabelStackView()
        setupGetButton()
        
//        setupAppDevLabel()
        
//        setupAppInstallButton()
//        setupInAppPurchaseLabel()
    }
    
    private func setupAppImageView() {
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(appImageView)
        
        NSLayoutConstraint.activate([
            appImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20.0),
            appImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 7.0),
            appImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -7.0),
            appImageView.heightAnchor.constraint(equalToConstant: 62),
            appImageView.widthAnchor.constraint(equalTo: appImageView.heightAnchor)
            ])
    }
    
    private func setupAppLabelStackView() {
        appNameLabel.text = "App Name"
        appSubLabel.text = "App Description"
        
        appLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        appLabelStackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        appLabelStackView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        appLabelStackView.addArrangedSubview(appNameLabel)
        appLabelStackView.addArrangedSubview(appSubLabel)
        
        self.contentView.addSubview(appLabelStackView)
        
        NSLayoutConstraint.activate([
            appLabelStackView.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 18.0),
            appLabelStackView.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 8.0),
            appLabelStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -8.0),
            //appLabelStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8.0),
            appLabelStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
            
            ])
    }
    
    private func setupGetButton() {
        getBtn.translatesAutoresizingMaskIntoConstraints = false
        
//        getBtn.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        getBtn.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        self.contentView.addSubview(getBtn)
        
        NSLayoutConstraint.activate([
            getBtn.leadingAnchor.constraint(equalTo: appLabelStackView.trailingAnchor, constant: 6.0),
            getBtn.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0),
             getBtn.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12.0),
             getBtn.widthAnchor.constraint(equalToConstant: 70.5)
            ])
        
        inAppText.translatesAutoresizingMaskIntoConstraints = false
        inAppText.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        self.contentView.addSubview(inAppText)
        
        NSLayoutConstraint.activate([
            inAppText.widthAnchor.constraint(equalTo: getBtn.widthAnchor, constant: 0.0),
            inAppText.centerXAnchor.constraint(equalTo: getBtn.centerXAnchor, constant: 0.0),
            inAppText.topAnchor.constraint(equalTo: getBtn.bottomAnchor, constant: 5.0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
