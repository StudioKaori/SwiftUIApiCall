//
//  SearchResultListItemView.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-27.
//

import SwiftUI

struct SearchResultListItemView: View {
    let tvShow: TvShow
    
    var body: some View {
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
                    
                    Spacer()
                    
                    Image(systemName: "star.fill")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                    
                    Text(String(tvShow.show.rating.average ?? 0))
                        .font(.footnote)
                }
                
                if let genres: [String] = tvShow.show.genres {
                    HStack {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                                .font(.footnote)
                        }
                    }
                }
            }

        }
    }
}

//struct SearchResultListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultListItemView()
//    }
//}
