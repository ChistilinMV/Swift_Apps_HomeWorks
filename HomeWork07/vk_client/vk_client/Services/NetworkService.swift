//
//  NetworkService.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 30.11.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func getData(request: Requests, completion:@escaping (Result<Decodable, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
//    enum Requests {
//        case friends
//        case groups
//        case photos
//        case user
//    }
    
    enum NetworkError: Error {
        case dataError
    }
    
    static var friendsRequest = NetworkRequest(urlTemplate:
        "https://api.vk.com/method/friends.get?fields=nickname,photo_50,online&access_token={token}&v=5.199", dataType: FriendsDataModel.self)
    
    static var groupsRequest = NetworkRequest(urlTemplate:
        "https://api.vk.com/method/groups.get?extended=1&access_token={token}&v=5.199", dataType: GroupsDataModel.self)
    
    static var photosRequest = NetworkRequest(urlTemplate: "https://api.vk.com/method/photos.get?fields=bdate&access_token={token}&v=5.199&album_id=wall", dataType: PhotosDataModel.self)
    
    static var userRequest = NetworkRequest(urlTemplate: "https://api.vk.com/method/users.get?fields=photo_200&owner_id={userid}&access_token={token}&v=5.199", dataType: UserDataModel.self)
    
    func returnNetworkRequest(request: Requests) -> NetworkRequest {
        switch request {
        case .friends: return NetworkService.friendsRequest
        case .groups: return NetworkService.groupsRequest
        case .photos: return NetworkService.photosRequest
        case .user: return NetworkService.userRequest
        }
    }
    
    func getData(request:Requests, completion:@escaping (Result<Decodable, Error>) -> Void) {
        
        let request = returnNetworkRequest(request: request)
        guard let url = request.generateUrl(token: NetworkService.token, userID: NetworkService.userID) as URL? else {
            print("Error while generating URL")
            return
        }
    
        session.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(NetworkError.dataError))
                return
            }
            if let error = error {
                completion(.failure(error))
            }
        
            do {
                let result = try JSONDecoder().decode(request.dataType, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
