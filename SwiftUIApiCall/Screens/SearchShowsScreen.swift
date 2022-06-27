//
//  ContentView.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct SearchShowsScreen: View {
    // MARK: - Properties
    @StateObject private var searchShowsViewModel = SearchShowsViewModel()
    @State private var searchWord = ""
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(searchShowsViewModel.tvShows) { tvShow in
                    
                    NavigationLink(destination: ShowDetailsScreen(tvShow: tvShow)) {
                        SearchResultListItemView(tvShow: tvShow)
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical, 6)
                }
                
            }
            .navigationTitle("TVMAZE Search")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading: HStack (alignment: .center, spacing: 6) {
                
                TextField("Search TV Shows...", text: $searchWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.asciiCapable)
                    .frame(width: UIScreen.main.bounds.width - 40)
            })
            .onChange(of: searchWord,
                      perform: { searchWord in
                if searchWord != "", searchWord != " " {
                    searchShowsViewModel.searchShows(query: searchWord)
                }else{
                    searchShowsViewModel.tvShows = []
                }
                
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchShowsScreen()
    }
}
