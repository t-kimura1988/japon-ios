//
//  PrivacyPolicyView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var japonHomePageUrl: String = Env["HOME_PAGE_URL"]!
    
    var body: some View {
        JaponWebView(url: "\(japonHomePageUrl)/privacy-policy")
            .navigationTitle("D-Aic")
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}

