//
//  Item.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/13.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

extension Qiita {
    public class Item {
        public let id: String!
        public let body: String!
        public let title: String!
        public let url: NSURL!
        
        public init?(json: AnyObject) {
            if let jsonObject = json as? NSDictionary {
                if let id = jsonObject["id"] as? String {
                    self.id = id
                }
                if let body = jsonObject["body"] as? String {
                    self.body = body
                }
                if let title = jsonObject["title"] as? String {
                    self.title = title
                }
                if let urlString = jsonObject["url"] as? String {
                    self.url = NSURL(string: urlString)!
                }
            }
        }
    }
}
