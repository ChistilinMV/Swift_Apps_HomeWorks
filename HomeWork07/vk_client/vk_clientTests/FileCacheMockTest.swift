//
//  FileCacheMockTest.swift
//  vk_clientTests
//
//  Created by Max on 16.12.2023.
//

import Foundation
import XCTest
@testable import vk_client

final class FileCacheMock: FileCacheProtocol {
    private(set) var isfetchAllFriendsCalled = false
    private(set) var isfetchFriendsDateCalled = false
    private(set) var iscreateFriendCalled = false
    private(set) var issetFriendsDateCalled = false
    private(set) var isaddFriendsCalled = false
    
    func fetchAllFriends() -> [FriendsDataModel.Response.Friend] {
        isfetchAllFriendsCalled = true
        return []
    }
    
    func fetchFriendsDate() -> String {
        isfetchFriendsDateCalled = true
        return ""
    }
    
    func createFriend(dataPoint: FriendsDataModel.Response.Friend) {
        iscreateFriendCalled = true
    }
    
    func setFriendsDate() {
        issetFriendsDateCalled = true
    }
    
    func addFriends(friends: [FriendsDataModel.Response.Friend]) {
        isaddFriendsCalled = true
    }
}
