//
//  UserViewController.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/13.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import UIKit
import Qiita

class UserViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secretsURL = NSBundle.mainBundle().URLForResource("Secrets", withExtension: "plist")!
        let secrets = NSDictionary(contentsOfURL: secretsURL)!
        let accessToken = secrets["QiitaAccessToken"] as String!
        let client = Qiita.Client(accessToken: accessToken)
        
        let request = client.getUser("naoty_k")
        request.onComplete { [unowned self] user in
            dispatch_async(dispatch_get_main_queue()) {
                self.title = user.name
            }
        }
        request.onError { error in
            println(error)
        }
        request.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}