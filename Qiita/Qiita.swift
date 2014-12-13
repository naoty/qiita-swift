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
        
        public init(accessToken: String) {
            self.accessToken = accessToken
            self.session = NSURLSession.sharedSession()
        }
        
        public func getItems() -> Request<[Item]> {
            let request = Request<[Item]>()
            
            
            let url = NSURL(string: "http://qiita.com/api/v2/items")!
            let task = session.dataTaskWithURL(url, completionHandler: { data, response, error in
                func onError(error: NSError) {
                    request.reject(error)
                    return
                }
                
                if error != nil {
                    onError(error)
                }
                
                var serializeError: NSErrorPointer = nil
                let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: serializeError)!
                
                if serializeError != nil {
                    onError(serializeError.memory!)
                }
                
                if let jsonObjects = json as? NSArray {
                    var items: [Item] = []
                    for jsonObject: AnyObject in jsonObjects {
                        if let item = Item(json: jsonObject) {
                            items.append(item)
                        }
                    }
                    request.resolve(items)
                } else {
                    onError(serializeError.memory!)
                }
            })
            task.resume()
            
            return request
        }
    }
}

public class Request<T> {
    private var onCompleteHandler: ((T) -> Void)?
    private var onErrorHandler: ((NSError) -> Void)?
    
    public func onComplete(handler: (T) -> Void) -> Request<T> {
        onCompleteHandler = handler
        return self
    }
    
    public func onError(handler: (NSError) -> Void) -> Request<T> {
        onErrorHandler = handler
        return self
    }
    
    public func resolve(value: T) {
        onCompleteHandler?(value)
    }
    
    public func reject(error: NSError) {
        onErrorHandler?(error)
    }
}