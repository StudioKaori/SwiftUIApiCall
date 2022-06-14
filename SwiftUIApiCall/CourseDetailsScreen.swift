//
//  CourseDetailsScreen.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct CourseDetailsScreen: View {
    var course: Course
    
    var body: some View {
        VStack {
            URLImage(urlString: course.image)
            Text(course.name)

        }
    }
}

struct CourseDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsScreen(course: Course(name: "Title", image: "https://iosacademy.io/assets/images/courses/tiktok.png"))
    }
}
