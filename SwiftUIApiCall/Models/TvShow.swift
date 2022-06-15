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
