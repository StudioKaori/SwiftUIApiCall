//
//  ViewModel.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import Foundation
import SwiftUI

class SearchShowsViewModel: ObservableObject {
    // MARK: - Properties
    @Published var tvShows: [TvShow] = []
    
    // MARK: - Methods
    
    /// Search TV shows from TVMAZE by string query.
    func searchShows(query: String) {
        guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=\(query)") else {
            return
        }
        
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
