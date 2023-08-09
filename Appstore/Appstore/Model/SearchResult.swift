//
//  SearchResult.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/30/23.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
}
