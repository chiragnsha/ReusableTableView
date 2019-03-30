//
//  ContactsViewController.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 25/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class CallsViewDataManager: ReusableTableViewDataManager<CallsViewDataProvider, CallsViewDataBinder>, ReusableTableViewContainerProtocol {
    typealias CellModelType = Call
    typealias TableViewCellType = CallCell
    
//    typealias CellModelType = Self.CellModelType
//    typealias TableViewCellType = UITableViewCell
    
    override init(with dataProvider: CallsViewDataProvider, and dataBinder: CallsViewDataBinder) {
        super.init(with: dataProvider, and: dataBinder)
        
        
    }
}


class CallsViewController: UIViewController {
    
    public enum CallState {
        case missed
        case outgoing
        case any
    }
    
    var callsViewDataManager: CallsViewDataManager
    var callsViewDataProvider: CallsViewDataProvider
    var callsViewDataBinder: CallsViewDataBinder
    
    //var calls: [Call] = []
    
    var callsTableView: ReusableTableView<CallsViewDataManager.TableViewCellType>
    
    init() {
        callsViewDataProvider = CallsViewDataProvider.init()
        callsViewDataBinder = CallsViewDataBinder.init()
        
        callsViewDataManager = CallsViewDataManager.init(with: callsViewDataProvider, and: callsViewDataBinder)
        
        callsTableView = ReusableTableView.init(frame: .zero, style: .plain)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let segmentControl = UISegmentedControl.init(items: ["All", "Missed"])
        
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentControl(segmentControl:)), for: .valueChanged)
        
        self.navigationItem.titleView = segmentControl
        self.navigationItem.title = "Contacts"
        
        self.view.backgroundColor = UIColor.white

        setupCallsTableView()
        loadCalls(for: .any)
    }
    
    private func setupCallsTableView() {
        callsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        callsTableView.dataSource = callsViewDataManager
        callsTableView.delegate = callsViewDataManager
        
        callsTableView.tableFooterView = UIView()
        self.view.addSubview(callsTableView)
        
        NSLayoutConstraint.activate([
            callsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            callsTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            callsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            callsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ])
    }
    
    private func loadCalls(for type: CallState) {
        do {
            let allCalls = try JSONDecoder.init().decode([Call].self, from: API.calls.sampleData)
            
            var indexPaths: [IndexPath] = []
            
            let missedCallsEnumerated = allCalls.enumerated().filter { (offset, call) -> Bool in
                
                if type == .missed {
                    if call.isMissed == false {
                        indexPaths.append(IndexPath.init(row: offset, section: 0))
                    }
                } else {
                    indexPaths.append(IndexPath.init(row: offset, section: 0))
                }
                    return call.isMissed
                }
            
            
            if type == .missed {
                var missedCalls: [Call] = []
                
                for missedCall in missedCallsEnumerated {
                    missedCalls.append(missedCall.element)
                }
                
                callsViewDataProvider.setCalls(missedCalls)
            } else {
                callsViewDataProvider.setCalls(allCalls)
            }
            
            if callsViewDataProvider.models.count < allCalls.count {
                callsTableView.performBatchUpdates({
                    if type == .missed {
                        callsTableView.deleteRows(at: indexPaths, with: .automatic)
                    }
                }, completion: nil)
            } else {
                callsTableView.reloadData()
            }
        } catch {
            print(error)
        }
        
//        callsTableView.beginUpdates()
//        callsTableView.endUpdates()
        
//        callsTableView.performBatchUpdates({
//            //callsTableView.deleteRows(at: [], with: .fade)
//        }, completion: nil)
    }
    
    @objc func segmentControl(segmentControl: UISegmentedControl) {
        if(segmentControl.selectedSegmentIndex == 0) {
            loadCalls(for: .any)
        } else {
            loadCalls(for: .missed)
        }
    }
}

class CallsViewDataProvider: ReusableDataProviderProtocol {
    typealias Model = CallsViewDataManager.CellModelType
    var models: [CallsViewDataManager.CellModelType] {
        return calls
    }
    
    private var calls: [Model] = []
    
    public func setCalls(_ calls: [Model]) {
        self.calls = calls
    }
}

class CallsViewDataBinder: ReusableCellDataBinderProtocol {
    typealias CellModel = CallsViewDataManager.CellModelType
    typealias CellType = CallsViewDataManager.TableViewCellType
    
    func bind(data: Call, to cell: CallsViewDataManager.TableViewCellType) {
        
        cell.callModeLabel.text = data.callType
        cell.callerNameLabel.text = data.name
        
        if data.isMissed == false {
            let randomBool = Bool.random()
            
            cell.callImageView.isHidden = randomBool
            
            if randomBool {
                cell.callerNameLabel.text = data.name + " (\(Int.random(in: 1..<3)))"
            } else {
                cell.callerNameLabel.text = data.name
            }
            
            cell.callerNameLabel.textColor = UIColor.darkText
        } else {
            let randomBool = Bool.random()
            
            if randomBool {
                cell.callerNameLabel.text = data.name + " (\(Int.random(in: 1..<3)))"
            } else {
                cell.callerNameLabel.text = data.name
            }
            
            cell.callImageView.isHidden = true
            cell.callerNameLabel.textColor = UIColor.red
        }
        
        cell.callTimeLabel.text = data.relativeDateString
    }
}
