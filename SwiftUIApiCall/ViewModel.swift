//
//  ViewModel.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import Foundation
import SwiftUI

struct Show: Codable {
    let name: String
    let image: ShowImage
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

class ViewModel: ObservableObject {
    @Published var tvShows: [TvShow] = []
    
    func fetch(query: String) {
        guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=\(query)") else {
        return
    }
        
//        func fetch() {
//            print("fetch")
//            guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=girl") else {
//            return
//        }
    
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Fetching data error")
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            do {
                let courses = try JSONDecoder().decode([TvShow].self, from: data)
                print(courses)
                DispatchQueue.main.async {
                    self?.tvShows = courses
                }
            }
            catch {
                print("Error: \(error)")
            }
            
        }
        
        task.resume()
    }
}
