//
//  NetworkRequest.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 30.11.2023.
//

import Foundation

struct PhotosDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Photo]
        
        struct Photo: Decodable {
            var id: Int
            var text: String?
            let sizes: [Size]
            
            struct Size: Decodable {
                let url: String?
                
            }
        }
    }
}


