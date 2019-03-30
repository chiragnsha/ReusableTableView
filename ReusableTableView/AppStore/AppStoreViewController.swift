//
//  iTunesViewController.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 22/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

class AppStoreSearchHelper {
    let API_KEY = "crDRxPd0Ptv2sVrrmbojJ0a3jr0"
    
    let BASE_URL = "https://api.apptweak.com/ios"
    let ARGUMENTS = "&country=us&language=us&device=iphone&num=20"
    let SEARCH_PATH = "/searches.json?term="
    
    let DETAILS_PATH = "/applications/"
    let FORMAT = ".json?"
    
    private func getSearchURLForQuery(query: String) -> String {
        let searchURL = "\(BASE_URL)\(SEARCH_PATH)\(query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "")\(ARGUMENTS)"
        return searchURL
    }
    
    func fetchApps(for keyword: String, completion:@escaping ([App]) -> Void) {
        let urlSession = URLSession.init(configuration: .default)
        var searchURLRequest = URLRequest.init(url: URL.init(string: getSearchURLForQuery(query: keyword))!)
        
        searchURLRequest.addValue(API_KEY, forHTTPHeaderField: "X-Apptweak-Key")
        
        let task = urlSession.dataTask(with: searchURLRequest) { (data, response, error) in
            
            guard error == nil, let data = data else {
                return
            }
            
            let responseString = String.init(data: data, encoding: .utf8)
            print(responseString)
            
            do {
                let appContainer = try JSONDecoder.init().decode(AppContainer.self, from: data)
                completion(appContainer.apps)
            } catch {
                
            }
        }
        
        task.resume()
    }
}

class AppStoreViewController: UITableViewController, ReusableTableViewContainerProtocol {
    typealias CellModelType = App
    typealias TableViewCellType = AppCell
    
    var searchController = UISearchController.init(searchResultsController: nil)
    var appStoreSearchHelper: AppStoreSearchHelper = AppStoreSearchHelper.init()
    
    var appsDataManager: ReusableTableViewDataManager<AppStoreViewController, AppStoreViewController>?
    
    var apps: [App] = {
//        do {
//            return (try JSONDecoder.init().decode(AppContainer.self, from: API.appstore.sampleData)).apps
//        } catch {
//            return []
//        }
        
        return []
    }()
    
    
    var backgroundLabel: UILabel = {
        let backgroundLabel = UILabel.init()
        
        let text = "Enter keyword to search apps";

        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0, weight: .semibold),                            NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        backgroundLabel.attributedText = NSAttributedString.init(attributedString: attributedString)
    
        backgroundLabel.textAlignment = .center
        
        return backgroundLabel
    }()
    
    
    init() {
        super.init(style: .plain)
       
        self.appsDataManager = ReusableTableViewDataManager.init(with: self, and: self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Search"
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        self.edgesForExtendedLayout = []
        
        setupSearchController()
        
        self.tableView.dataSource = self.appsDataManager
        self.tableView.delegate = self.appsDataManager
        self.tableView.tableFooterView = UIView()
        self.tableView.alwaysBounceVertical = true
        
        
//        self.tableView.refreshControl = UIRefreshControl.init()
        
        let tableViewRefreshControl = UIRefreshControl.init()
        tableViewRefreshControl.addTarget(self, action: #selector(test(refreshControl:)), for: .valueChanged)
        
        self.refreshControl = tableViewRefreshControl

        self.tableView.backgroundView = backgroundLabel
        
    }
    
    @objc func test(refreshControl: UIRefreshControl) {
        
        print("")
        DispatchQueue.main.async {
            refreshControl.endRefreshing()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        } else {
            // Fallback on earlier versions
        }
    
//        self.refreshControl?.beginRefreshing()
    }
    
    private func setupSearchController() {
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "App Store"
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.searchController?.searchBar.backgroundColor = UIColor.white
        } else {
            // Fallback on earlier versions
        }
        
        self.definesPresentationContext = true
        self.searchController.searchBar.delegate = self
    }
}

extension AppStoreViewController: ReusableDataProviderProtocol {
    typealias Model = CellModelType
    var models: [AppStoreViewController.CellModelType] {
        return apps
    }
}
extension AppStoreViewController: ReusableCellDataBinderProtocol {
    
    typealias CellModel = CellModelType
    typealias CellType = TableViewCellType
    
    func bind(data: AppStoreViewController.CellModelType, to cell: AppStoreViewController.TableViewCellType) {
        
        guard let appImageURL = URL.init(string: data.appPhoto) else {
            return
        }
        
        URLSession.shared.dataTask(with: appImageURL) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            print(response.statusCode)
            
            DispatchQueue.main.async {
                cell.appImageView.image = UIImage.init(data: data!)
            }
            }.resume()
        
        cell.appNameLabel.text = data.appName
        cell.appSubLabel.text = data.appDesc
        
        cell.inAppText.isHidden = data.in_apps
    }
}

extension AppStoreViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        
        searchBar.resignFirstResponder()
        
        
//        self.refreshControl?.beginRefreshing()
        
        if self.tableView.backgroundView == nil {
            self.tableView.backgroundView = backgroundLabel
        }
        
        let attributedString = backgroundLabel.attributedText?.mutableCopy() as? NSMutableAttributedString
        
        attributedString?.mutableString.setString("Loading")
        
        backgroundLabel.attributedText = attributedString
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.apps = []
        self.tableView.reloadData()
        
        appStoreSearchHelper.fetchApps(for: searchText) { (apps) in
//            self.apps = apps
            // tableview reloaddata......
            
            self.apps = apps
            
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
                self.tableView.reloadData()
                
                self.backgroundLabel.removeFromSuperview()
            }
        }
    }
}
