//
//  ContentView.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var searchWord = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tvShows) { tvShow in
                    
                    NavigationLink(destination: CourseDetailsScreen(tvShow: tvShow)) {
                        HStack {
                            URLImage(urlString: tvShow.show.image?
                                .medium ?? "")
                            
                            Text(tvShow.show.name)
                                .bold()
                        }
                    }
                        .padding(3)
                }
                
            }
            .navigationTitle("Courses")
            .navigationBarItems(leading: HStack {
                TextField("Search...", text: $searchWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.asciiCapable)
                    .frame(width: UIScreen.main.bounds.width - 40)
            })
            .onChange(of: searchWord,
                      perform: { searchWord in
                if searchWord != "", searchWord != " " {
                    viewModel.fetch(query: searchWord)
                }else{
                    viewModel.tvShows = []
                }
                
            })
//            .onAppear {
//                viewModel.fetch()
//            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
