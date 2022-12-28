//
//  HomeMain-PostList.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/27.
//

import SwiftUI

struct HomeMain_PostList: View {
    @EnvironmentObject private var homeMainVM: HomeMainViewModel
    var body: some View {
        ScrollView(.horizontal) {
            Text("jdalskjfklsajdlfkjalkdsfjla")
        }
        .onAppear{
            homeMainVM.getPosts()
        }
    }
}
