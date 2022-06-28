//
//  ShowDetailsScreen.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct ShowDetailsScreen: View {
    // MARK: - Properties
    var tvShow: TvShow
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
        URLImage(urlString: tvShow.show.image?.original ?? "")
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 400)
            .padding(.bottom, 60)
        
            ScrollView {

                Text(tvShow.show.name)
                    .font(.largeTitle)
                    .padding()
                
                if let genres: [String] = tvShow.show.genres {
                    Divider()
                    
                    HStack {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                                .font(.footnote)
                        }
                    }
                    
                    Divider()
                }
                
                HStack {
                    Text(tvShow.show.premiered?.appending(" -") ?? "")
                        .font(.footnote)
                    
                    Text(tvShow.show.ended ?? "")
                        .font(.footnote)
                    
                    Text("(\(tvShow.show.status))")
                        .font(.footnote)
                    
                    Image(systemName: "star.fill")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
                    Text(String(tvShow.show.rating.average ?? 0))
                        .font(.footnote)
                }
                .padding()
                
                if let url = URL(string: tvShow.show.officialSite ?? "") {
                    Divider()
                    
                    NavigationLink(destination: WebViewScreen(url: url)) {
                        Text(tvShow.show.webChannel?.name ?? "Official web site")
                    }
                    .padding()
                    
                    Divider()
                }
                
                Text(tvShow.stripHtmlTags(string: tvShow.show.summary ?? ""))

            }
            .background(.white)
            .padding()
        }
        .navigationTitle(tvShow.show.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .top)

    }
}

//struct ShowDetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDetailsScreen()
//    }
//}
