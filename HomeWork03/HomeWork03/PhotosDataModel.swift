//
//  PhotosDataModel.swift
//  HomeWork03
//
//  Created by Max on 30.11.2023.
//

import Foundation

struct PhotosDataModel: Decodable {
    let response: Response
    
    struct Response: Decodable {
        let items: [Photo]
        
        struct Photo: Decodable {
            let sizes: [Size]
            
            struct Size: Decodable {
                let url: String
                
            }
        }
    }
}
