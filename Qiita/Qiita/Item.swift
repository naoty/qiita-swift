//
//  Item.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/13.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

extension Qiita {
    public class Item {
        public let body: String?
        public let coediting: Bool?
        public let createdAt: NSDate?
        public let id: String?
        public let isPrivate: Bool?
        public let title: String?
        public let updatedAt: NSDate?
        public let url: NSURL?
        public let user: User?
        
        private var dateFormatter: NSDateFormatter {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return formatter
        }
        
        public init?(json: AnyObject) {
            if let jsonObject = json as? NSDictionary {
                if let body = jsonObject["body"] as? String {
                    self.body = body
                }
                if let coediting = jsonObject["coediting"] as? Bool {
                    self.coediting = coediting
                }
                if let createdAtTimestamp = jsonObject["created_at"] as? String {
                    self.createdAt = dateFormatter.dateFromString(createdAtTimestamp)
                }
                if let id = jsonObject["id"] as? String {
                    self.id = id
                }
                if let isPrivate = jsonObject["private"] as? Bool {
                    self.isPrivate = isPrivate
                }
                if let title = jsonObject["title"] as? String {
                    self.title = title
                }
                if let updatedAtTimestamp = jsonObject["updated_at"] as? String {
                    self.updatedAt = dateFormatter.dateFromString(updatedAtTimestamp)
                }
                if let urlString = jsonObject["url"] as? String {
                    self.url = NSURL(string: urlString)!
                }
                if let userJSONObject: AnyObject = jsonObject["user"] {
                    self.user = User(json: userJSONObject)
                }
            } else {
                return nil
            }
        }
    }
}