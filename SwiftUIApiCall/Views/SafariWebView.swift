//
//  SafariWebViewScreen.swift
//  SwiftUIApiCall
//
//  Created by Kaori Persson on 2022-06-15.
//

import SwiftUI
import SafariServices

struct SafariWebView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariWebView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariWebView>) {}
}
