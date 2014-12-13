//
//  Request.swift
//  Qiita
//
//  Created by Naoto Kaneko on 2014/12/13.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

public class Request<T>: NSObject {
    var task: NSURLSessionDataTask?
    private var onCompleteHandler: ((T) -> Void)?
    private var onErrorHandler: ((NSError) -> Void)?
    
    public override init() {
        super.init()
    }
    
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
    
    public func resume() {
        task?.resume()
    }
    
    func setDataTaskWithSession(session: NSURLSession, url: NSURL, completionHandler: (AnyObject?) -> Void) {
        task = session.dataTaskWithURL(url, completionHandler: { [unowned self] data, response, error in
            // TODO: Handle errors such as 401 Unauthorized
            
            if error != nil {
                self.reject(error)
                return
            }
            
            var serializeError: NSErrorPointer = nil
            let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments, error: serializeError)!
            
            if serializeError != nil {
                self.reject(serializeError.memory!)
                return
            }
            
            completionHandler(json)
        })
    }
}