//
//  HomeTab-Ios+IpadV.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/24.
//

import SwiftUI

struct HomeTab_Ios_V: View {
    var body: some View {
        ZStack {
            TabView {
                HomeMainView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("HOME")
                    }
                    .tag(1)
            }
        }
    }
}

struct HomeTab_H: View {
    @EnvironmentObject private var homeMainVM: HomeMainViewModel
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Button(action: {
                    withAnimation{
                        homeMainVM.changeCalendarFlg()
                        
                    }
                }, label: {
                    VStack {
                        Image(systemName: "calendar.circle")
                        if homeMainVM.isCalendar {
                            Image(systemName: "arrowshape.left.fill")
                            
                        } else {
                            Image(systemName: "arrowshape.right.fill")
                            
                        }
                        
                    }
                    
                })
                Spacer()
                Image(systemName: "house")
            }
            .frame(width: 50)
            .zIndex(0)
            Divider()
            HomeMainView()
                .zIndex(1)
            Spacer()
        }
    }
}
