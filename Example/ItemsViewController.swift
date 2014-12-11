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
    
    override func viewDidLoad() {
        let client = Qiita.Client(accessToken: "")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = "sample"
        
        return cell
    }
}