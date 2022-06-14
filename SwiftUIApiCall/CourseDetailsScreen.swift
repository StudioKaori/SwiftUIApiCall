//
//  CourseDetailsScreen.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct CourseDetailsScreen: View {
    var tvShow: TvShow
    
    var body: some View {
        VStack {
            URLImage(urlString: tvShow.show.image.original)
            Text(tvShow.show.name)

        }
    }
}

//struct CourseDetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseDetailsScreen()
//    }
//}
