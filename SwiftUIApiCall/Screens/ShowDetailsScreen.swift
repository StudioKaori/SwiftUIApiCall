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
                Text(tvShow.show.summary ?? "")
                if let url = URL(string: tvShow.show.url) {
                    NavigationLink(destination: SafariWebViewScreen(url: url)) {
                        Text(tvShow.show.url)
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)

    }
}

//struct ShowDetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowDetailsScreen()
//    }
//}
