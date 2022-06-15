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
        VStack {
            URLImage(urlString: tvShow.show.image?.original ?? "")
            
            ScrollView {
                Text(tvShow.show.name)
                Text(tvShow.show.summary ?? "")
                if let url = URL(string: tvShow.show.url) {
                    NavigationLink(destination: SafariWebViewScreen(url: url)) {
                        Text(tvShow.show.url)
                    }
                }
            }
            

            

        }
    }
}

//struct ShowDetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDetailsScreen()
//    }
//}
