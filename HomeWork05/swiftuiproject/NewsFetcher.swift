//
//  NewsFetcher.swift
//  swiftuiproject
//
//  Created by Max on 09/12/2023.
//

import Foundation

class NewsFetcher: ObservableObject {
    @Published var newsItems: [NewsDataModel.News] = []

    func fetchNews() {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=&fields=id,title,publication_date&expand=&order_by=&text_format=text&ids=&location=&actual_only=true") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
                    DispatchQueue.main.async {
                        self.newsItems = decodedResponse.results
                    }
                    return
                } else {
                    print("encodding error")
                }
            } else {
                print("cant load the data")
            }
        }.resume()
    }
}
