//
//  UserDataModel.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 08.12.2023.
//

import Foundation

struct UserDataModel: Decodable {
    let response: [User]
    
    struct User: Decodable {
        let firstName: String?
        let lastName: String?
        let photoUrl: String?
        
        enum CodingKeys: String, CodingKey {
            case firstName = "first_name"
            case lastName = "last_name"
            case photoUrl = "photo_200"
        }
    }
}
