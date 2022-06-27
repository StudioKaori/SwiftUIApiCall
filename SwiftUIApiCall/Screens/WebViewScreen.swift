//
//  WebViewScreen.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-27.
//

import SwiftUI

struct WebViewScreen: View {
    let url: URL
    
    var body: some View {
        SafariWebView(url: url)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct WebViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        WebViewScreen(url: URL(string: "")!)
    }
}
