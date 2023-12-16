//
//  FriendViewControllerTests.swift
//  vk_client
//
//  Created by Max on 16.12.2023.
//

import Foundation
import XCTest
@testable import vk_client

final class FriendsControllerTests: XCTestCase {
    private var friendsController: FriendsViewController!
    private var networkService: NetworkServiceMockTest!
    private var fileCache: FileCacheMock!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkServiceMockTest()
        fileCache = FileCacheMock()
        friendsController = FriendsViewController(networkService: networkService!, data: [], fileCache: fileCache!)
    }
    
    override func tearDown() {
        friendsController = nil
        networkService = nil
        fileCache = nil
        super.tearDown()
    }
     
    func testGetFriends() {
        friendsController.updateData()
        XCTAssertTrue(networkService.isGetFriendsWasCalled, "failure")
    }
    
}
