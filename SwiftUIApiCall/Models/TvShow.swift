//
//  TvShow.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-15.
//

import Foundation

struct Show: Codable {
    let name: String
    let image: ShowImage?
    let premiered: String?
    let ended: String?
    let status: String
    let type: String
    let language: String
    let url: String
    let officialSite: String?
    let rating: Rating
    let schedule: Schedule
    let summary: String?
    let webChannel: WebChannel?
}

struct Rating: Codable {
    let average: Double?
}

struct Schedule: Codable {
    let time: String
    let days: [String]
}

struct WebChannel: Codable {
    let name: String
    let officialSite: String?
}

struct ShowImage: Codable {
    let medium: String
    let original: String
}

struct TvShow: Codable, Identifiable {
    var id = UUID()
    let show: Show
    
    private enum CodingKeys : String, CodingKey { case show }
}
