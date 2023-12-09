//
//  ContentView.swift
//  swiftuiproject
//
//  Created by Max on 09/12/2023.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink("Read News", destination: { NextView()
            })
        }
        .navigationTitle("First Screen")
    }
}

struct NextView: View {
    @ObservedObject var fetcher = NewsFetcher()

    var body: some View {
        NavigationView {
            List(fetcher.newsItems) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                    Text("Published on \(Date(timeIntervalSince1970: TimeInterval(item.publicationDate)))")
                        .font(.subheadline)
                }
            }
            .navigationTitle("News Screen")
        }
        .onAppear {
            fetcher.fetchNews()
        }
    }
}

#Preview {
    NextView()
}

