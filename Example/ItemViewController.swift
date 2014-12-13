//
//  ItemViewController.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/13.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import UIKit
import Qiita

class ItemViewController: UIViewController {
    @IBOutlet var textView: UITextView?
    
    var itemID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secretsURL = NSBundle.mainBundle().URLForResource("Secrets", withExtension: "plist")!
        let secrets = NSDictionary(contentsOfURL: secretsURL)!
        let accessToken = secrets["QiitaAccessToken"] as String!
        let client = Qiita.Client(accessToken: accessToken)
        
        let request = client.getItem(itemID!)
        request.onComplete { [unowned self] item in
            dispatch_async(dispatch_get_main_queue()) {
                self.title = item.title
                self.textView?.text = item.body
            }
        }
        request.onError { error in println(error) }
        request.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}