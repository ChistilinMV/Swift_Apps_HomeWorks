//
//  FriendsDataModel.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 30.11.2023.
//

import Foundation


struct FriendsDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Friend]
        
        struct Friend: Decodable {
            let id: Int
            let firstName: String?
            let lastName: String?
            let photo: String?
            let online: Int
            
            enum CodingKeys: String, CodingKey {
                case firstName = "first_name"
                case lastName = "last_name"
                case photo = "photo_50"
                case online, id
            }
        }
    }
}
