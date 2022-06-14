//
//  ViewModel.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import Foundation
import SwiftUI

struct Course: Hashable, Decodable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
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
                let courses = try JSONDecoder().decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print("Error: \(error)")
            }
            
        }
        
        task.resume()
    }
}
