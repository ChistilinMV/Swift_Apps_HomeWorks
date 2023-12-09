//
//  NewsDataModel.swift
//  swiftuiproject
//
//  Created by Max on 09/12/2023.
//

import Foundation

struct NewsDataModel: Codable {
    
    var results: [News]
    
    struct News: Identifiable, Codable {
        var id: Int
        var title: String
        var publicationDate: Int
        
        enum CodingKeys: String, CodingKey {
            case id, title
            case publicationDate = "publication_date"
        }
    }
}
