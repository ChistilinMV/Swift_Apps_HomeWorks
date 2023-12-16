//
//  vk_clientUITestsLaunchTest.swift
//  vk_clientUITests
//
//  Created by Max on 16.12.2023.
//

import XCTest

final class VkClientUITestsLaunchTest: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
