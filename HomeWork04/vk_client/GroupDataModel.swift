//
//  GroupDataModel.swift
//  HomeWork04 VK_Client
//
//  Created by Max on 30.11.2023.
//

import Foundation

struct GroupsDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Group]
        
        struct Group: Decodable {
            let name: String?
            let photo: String?
            
            enum CodingKeys: String, CodingKey {
                case name
                case photo = "photo_50"
            }
        }
    }
}
