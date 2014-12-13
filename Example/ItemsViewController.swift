//
//  ItemsViewController.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/11.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import UIKit
import Qiita

class ItemsViewController: UITableViewController {
    let cellIdentifier = "ItemCell"
    var items: [Qiita.Item] = []
    
    override func viewDidLoad() {
        let secretsURL = NSBundle.mainBundle().URLForResource("Secrets", withExtension: "plist")!
        let secrets = NSDictionary(contentsOfURL: secretsURL)!
        let accessToken = secrets["QiitaAccessToken"] as String!
        let client = Qiita.Client(accessToken: accessToken)
        
        let request = client.getItems()
        request.onComplete { [unowned self] items in
            self.items = items
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        request.onError { error in println(error) }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        
        let item = self.items[indexPath.row]
        cell.textLabel?.text = item.title
        
        return cell
    }
}