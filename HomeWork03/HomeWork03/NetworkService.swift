//
//  NetworkService.swift
//  HomeWork03
//
//  Created by Max on 30.11.2023.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    enum Requests {
        case friends
        case groups
        case photos
    }
    

    static var friendsRequest = NetworkRequest(urlTemplate:
        "https://api.vk.com/method/friends.get?fields=nickname,photo_50&access_token={token}&v=5.199", dataType: FriendsDataModel.self)
    
    static var groupsRequest = NetworkRequest(urlTemplate:
        "https://api.vk.com/method/groups.get?extended=1&access_token={token}&v=5.199", dataType: GroupsDataModel.self)
    
    static var photosRequest = NetworkRequest(urlTemplate: "https://api.vk.com/method/photos.getAll?owner_id={userid}&access_token={token}&v=5.199", dataType: PhotosDataModel.self)
    
    func returnNetworkRequest(request: Requests) -> NetworkRequest {
        switch request {
        case .friends: return NetworkService.friendsRequest
        case .groups: return NetworkService.groupsRequest
        case .photos: return NetworkService.photosRequest
        }
    }
    
    
    func getData(request:Requests) {
        
        let request = returnNetworkRequest(request: request)
        
        guard let url = request.generateUrl(token: NetworkService.token, userID: NetworkService.userID) as URL? else {
            print("Error while generating URL")
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            
            guard let data else {
                return
            }
        
            do {
                let friends = try JSONDecoder().decode(request.dataType, from: data)
                print(friends)
            } catch {
                print(error)
            }
            
        }.resume()
    }
}
