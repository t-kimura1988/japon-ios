//
//  UnAuthView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import SwiftUI

struct UnAuthView: View {
   @EnvironmentObject var vm: AccountExistViewModel
   
   var japonHomePageUrl: String = Env["HOME_PAGE_URL"]!
   
   var body: some View {
       NavigationView {
           JaponWebView(url: "\(japonHomePageUrl)/unauth")
               .navigationTitle("D-Aic")
               .navigationBarTitleDisplayMode(.inline)
               .navigationBarItems(
                   trailing: NavigationLink{
                       SignInView()
                   } label: {
                       Text("ログイン")
                   })
           
           Rectangle()
           .foregroundColor(Color.black)
           .opacity(1.0)
       }
       .navigationViewStyle(.stack)
   }
}

struct UnAuthView_Previews: PreviewProvider {
   static var previews: some View {
       UnAuthView()
   }
}
