//
//  ReusableTableViewDataManager.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class ReusableTableViewDataManager<DataProvider: ReusableDataProviderProtocol, DataBinder: ReusableCellDataBinderProtocol>: NSObject, UITableViewDataSource, UITableViewDelegate where DataProvider.Model == DataBinder.CellModel {
    
    ///strong references
    private var _dataProvider: DataProvider
    private var _dataBinder: DataBinder
    
    init(with dataProvider: DataProvider,and dataBinder: DataBinder) {
        self._dataProvider = dataProvider
        self._dataBinder = dataBinder
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return _dataProvider.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DataBinder.CellType.self)) else {
            tableView.register(DataBinder.CellType.self, forCellReuseIdentifier: NSStringFromClass(DataBinder.CellType.self))
            
            return tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DataBinder.CellType.self), for: indexPath)
        }
        
//        tableViewCell.layoutIfNeeded()
        
        return tableViewCell
        //return tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(DataBinder.Cell.self), for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellModel = _dataProvider.models[indexPath.row]
        
        if let dataBinderCell = cell as? DataBinder.CellType {
            _dataBinder.bind(data: cellModel, to: dataBinderCell)
//            dataBinderCell.setNeedsLayout()
        }
        
       // cell.layoutIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
}
