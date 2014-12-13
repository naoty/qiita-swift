//
//  User.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/12.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

extension Qiita {
    public class User {
        public let description: String?
        public let facebookID: String?
        public let followeesCount: Int?
        public let followersCount: Int?
        public let githubLoginName: String?
        public let id: String?
        public let itemsCount: Int?
        public let linkedinID: String?
        public let location: String?
        public let name: String?
        public let organization: String?
        public let profileImageURL: NSURL?
        public let twitterScreenName: String?
        public let websiteURL: NSURL?
        
        public init?(json: AnyObject) {
            if let jsonObject = json as? NSDictionary {
                if let description = jsonObject["description"] as? String {
                    self.description = description
                }
                if let facebookID = jsonObject["facebook_id"] as? String {
                    self.facebookID = facebookID
                }
                if let followeesCount = jsonObject["followees_count"] as? Int {
                    self.followeesCount = followeesCount
                }
                if let followersCount = jsonObject["followers_count"] as? Int {
                    self.followersCount = followersCount
                }
                if let githubLoginName = jsonObject["github_login_name"] as? String {
                    self.githubLoginName = githubLoginName
                }
                if let id = jsonObject["id"] as? String {
                    self.id = id
                }
                if let itemsCount = jsonObject["items_count"] as? Int {
                    self.itemsCount = itemsCount
                }
                if let linkedinID = jsonObject["linkedin_id"] as? String {
                    self.linkedinID = linkedinID
                }
                if let location = jsonObject["location"] as? String {
                    self.location = location
                }
                if let name = jsonObject["name"] as? String {
                    self.name = name
                }
                if let organization = jsonObject["organization"] as? String {
                    self.organization = organization
                }
                if let profileImageURLString = jsonObject["profile_image_url"] as? String {
                    self.profileImageURL = NSURL(string: profileImageURLString)
                }
                if let twitterScreenName = jsonObject["twitter_screen_name"] as? String {
                    self.twitterScreenName = twitterScreenName
                }
                if let websiteURL = jsonObject["website_url"] as? String {
                    self.websiteURL = NSURL(string: websiteURL)
                }
            } else {
                return nil
            }
        }
    }
}