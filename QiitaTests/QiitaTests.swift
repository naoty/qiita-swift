//
//  QiitaTests.swift
//  QiitaTests
//
//  Created by Naoto Kaneko on 2014/12/11.
//  Copyright (c) 2014年 Naoto Kaneko. All rights reserved.
//

import Qiita
import XCTest

class QiitaTests: XCTestCase {
    var client: Qiita.Client!
    
    override func setUp() {
        super.setUp()
        
        let secretsURL = NSBundle(forClass: QiitaTests.self).URLForResource("Secrets", withExtension: "plist")!
        let secrets = NSDictionary(contentsOfURL: secretsURL)!
        let accessToken = secrets["QiitaAccessToken"] as String!
        client = Qiita.Client(accessToken: accessToken)
    }
    
    func testGetItems() {
        let expectation = expectationWithDescription("get items")
        
        let request = client.getItems()
        request.onComplete { items in
            expectation.fulfill()
            XCTAssertGreaterThan(items.count, 0, "")
        }
        request.resume()
        
        waitForExpectationsWithTimeout(3) { error in request.cancel() }
    }
    
    func testGetItem() {
        let expectation = expectationWithDescription("get items")
        
        let request = client.getItem("b40b13735fd7f06f8cb7")
        request.onComplete { item in
            expectation.fulfill()
            XCTAssertNotNil(item, "")
        }
        request.resume()
        
        waitForExpectationsWithTimeout(3) { error in request.cancel() }
    }
}