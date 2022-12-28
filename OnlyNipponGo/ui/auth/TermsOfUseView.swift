//
//  TermsOfUseView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import SwiftUI

struct TermsOfUseView: View {
   var japonHomePageUrl: String = Env["HOME_PAGE_URL"]!
   
   var body: some View {
       JaponWebView(url: "\(japonHomePageUrl)/terms-of-use")
           .navigationTitle("Japon")
   }
}

struct TermsOfUseView_Previews: PreviewProvider {
   static var previews: some View {
       TermsOfUseView()
   }
}
