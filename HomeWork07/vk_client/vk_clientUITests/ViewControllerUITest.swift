//
//  ViewControllerUITest.swift
//  vk_clientUITests
//
//  Created by Max on 16.12.2023.
//

import XCTest

final class ViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }
    
    func testTransitionToTabBarController() {
        let webView = app.webViews.firstMatch
        XCTAssertTrue(webView.exists)
    }
}

