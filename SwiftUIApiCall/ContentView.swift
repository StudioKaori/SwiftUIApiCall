//
//  ContentView.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tvShows) { tvShow in
                    
                    NavigationLink(destination: CourseDetailsScreen(tvShow: tvShow)) {
                        HStack {
                            URLImage(urlString: tvShow.show.image.medium)
                            
                            Text(tvShow.show.name)
                                .bold()
                        }
                    }
                        .padding(3)
                }
                
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
