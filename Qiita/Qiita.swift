//
//  Qiita.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/11.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

public struct Qiita {
    public class Client {
        let accessToken: String
        let session: NSURLSession
        let baseURLString: String
        
        public init(accessToken: String, baseURLString: String = "http://qiita.com/api/v2") {
            self.accessToken = accessToken
            self.session = NSURLSession.sharedSession()
            self.baseURLString = baseURLString
        }
        
        // MARK: - Items
        
        public func getItems(parameters: [String:String] = [:]) -> Request<[Item]> {
            let request = Request<[Item]>()
            let url = buildURL("/items", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var items: [Item] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let item = Item(json: jsonObject) {
                            items.append(item)
                        }
                    }
                    request.resolve(items)
                }
            })
            return request
        }
        
        public func getItem(id: String, parameters: [String:String] = [:]) -> Request<Item> {
            let request = Request<Item>()
            let url = buildURL("/items/\(id)", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObject: AnyObject = json {
                    if let item = Item(json: jsonObject) {
                        request.resolve(item)
                    }
                }
            })
            return request
        }
        
        public func getUserItems(userID: String, parameters: [String:String] = [:]) -> Request<[Item]> {
            let request = Request<[Item]>()
            let url = buildURL("/users/\(userID)/items", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var items: [Item] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let item = Item(json: jsonObject) {
                            items.append(item)
                        }
                    }
                    request.resolve(items)
                }
            })
            return request
        }
        
        public func getUserStocks(userID: String, parameters: [String:String] = [:]) -> Request<[Item]> {
            let request = Request<[Item]>()
            let url = buildURL("/users/\(userID)/stocks", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var items: [Item] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let item = Item(json: jsonObject) {
                            items.append(item)
                        }
                    }
                    request.resolve(items)
                }
            })
            return request
        }
        
        // MARK: - Users
        
        public func getUsers(parameters: [String:String] = [:]) -> Request<[User]> {
            let request = Request<[User]>()
            let url = buildURL("/users", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var users: [User] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let user = User(json: jsonObject) {
                            users.append(user)
                        }
                    }
                    request.resolve(users)
                }
            })
            return request
        }
        
        public func getUser(id: String, parameters: [String:String] = [:]) -> Request<User> {
            let request = Request<User>()
            let url = buildURL("/users/\(id)", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObject: AnyObject = json {
                    if let user = User(json: jsonObject) {
                        request.resolve(user)
                    }
                }
            })
            return request
        }
        
        public func getAuthenticatedUser() -> Request<User> {
            let request = Request<User>()
            let url = buildURL("/authenticated_user")
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObject: AnyObject = json {
                    if let user = User(json: jsonObject) {
                        request.resolve(user)
                    }
                }
            })
            return request
        }
        
        public func getFollowees(id: String, parameters: [String:String] = [:]) -> Request<[User]> {
            let request = Request<[User]>()
            let url = buildURL("/users/\(id)/followees", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var users: [User] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let user = User(json: jsonObject) {
                            users.append(user)
                        }
                    }
                    request.resolve(users)
                }
            })
            return request
        }
        
        public func getFollowers(id: String, parameters: [String:String] = [:]) -> Request<[User]> {
            let request = Request<[User]>()
            let url = buildURL("/users/\(id)/followers", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var users: [User] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let user = User(json: jsonObject) {
                            users.append(user)
                        }
                    }
                    request.resolve(users)
                }
            })
            return request
        }
        
        public func getItemStockers(itemID: String, parameters: [String:String] = [:]) -> Request<[User]> {
            let request = Request<[User]>()
            let url = buildURL("/items/\(itemID)/stockers", parameters: parameters)
            request.setDataTaskWithSession(session, url: url, completionHandler: { json in
                if let jsonObjects = json as? NSArray {
                    var users: [User] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let user = User(json: jsonObject) {
                            users.append(user)
                        }
                    }
                    request.resolve(users)
                }
            })
            return request
        }
        
        // MARK: - Private methods
        
        private func buildURL(URLString: String, baseURLString: String? = nil, parameters: [String:String] = [:]) -> NSURL {
            let fullURLString = (baseURLString ?? self.baseURLString) + URLString + buildQuery(parameters)
            return NSURL(string: fullURLString)!
        }
        
        private func buildQuery(parameters: [String:String]) -> String {
            if parameters.count == 0 {
                return ""
            }
            
            var components: [String] = []
            for (key, value) in parameters {
                let component = "=".join([key, value])
                components.append(component)
            }
            return "?" + "&".join(components)
        }
    }
}