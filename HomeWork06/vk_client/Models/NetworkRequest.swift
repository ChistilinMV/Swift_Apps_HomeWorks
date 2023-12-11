//
//  NetworkRequest.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 30.11.2023.
//

import Foundation

struct NetworkRequest {

    let urlTemplate: String
    let dataType: Decodable.Type

    
    func generateUrl(token: String, userID: String) -> URL? {
        let urlString = urlTemplate
            .replacingOccurrences(of: "{token}", with: token)
            .replacingOccurrences(of: "{userid}", with: userID)
        return URL(string: urlString)
    }
}



