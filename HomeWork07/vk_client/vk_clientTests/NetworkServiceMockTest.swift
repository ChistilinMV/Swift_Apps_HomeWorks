//
//  NetworkServiceMockTest.swift
//  vk_clientTests
//
//  Created by Max on 16.12.2023.
//

import Foundation
import XCTest
@testable import vk_client

final class NetworkServiceMockTest: NetworkServiceProtocol {
    private(set) var isGetFriendsWasCalled = false
    
    func getData(request: Requests, completion:@escaping (Result<Decodable, Error>) -> Void) {
        isGetFriendsWasCalled = true
    }
}
