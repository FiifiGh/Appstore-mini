//
//  AppGroup.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 8/7/23.
//

import Foundation

struct AppGroup: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let name, artistName, artworkUrl100: String
    
}
