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
                        HStack {
                            URLImage(urlString: tvShow.show.image?
                                .medium ?? "")
                            .frame(width: 70, height: 70)
                            .background(Color.gray)
                            .cornerRadius(4)
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(tvShow.show.name)
                                    .bold()
                                
                                HStack {
                                    Text(tvShow.show.premiered?.prefix(4).appending(" -") ?? "")
                                        .font(.footnote)
                                    
                                    Text(tvShow.show.ended?.prefix(4) ?? "")
                                        .font(.footnote)
                                }
                            }

                        }
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical, 6)
                }
                
            }
            .navigationTitle("TVMAZE Search")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading: HStack {
                URLImage(urlString:  "https://static.tvmaze.com/images/tvm-header-logo.png")
                    .frame(width: 50, height: 50)
                    .background(Color.gray)
                
                TextField("Search...", text: $searchWord)
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
