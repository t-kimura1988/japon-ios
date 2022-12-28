//
//  JaponWebView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import SwiftUI
import WebKit

struct JaponWebView: UIViewRepresentable {
   
   let url: String
   private let observale = WebViewUrlObservale()
   
   var observer: NSKeyValueObservation? {
       observale.instance
   }
   
   func makeUIView(context: Context) -> WKWebView {
       return WKWebView()
   }
   
   func updateUIView(_ uiView: WKWebView, context: Context) {
       observale.instance = uiView.observe(\WKWebView.url, options: .new) { view, change in
           if let url = view.url {
               print("Page url: \(url)")
           }
           
       }
       
       uiView.load(URLRequest(url: URL(string: url)!))
   }
}

private class WebViewUrlObservale: ObservableObject {
   @Published var instance: NSKeyValueObservation?
}

