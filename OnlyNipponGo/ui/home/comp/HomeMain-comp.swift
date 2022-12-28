//
//  HomeMain-comp.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/24.
//

import SwiftUI

struct HomeMain_comp_iosV: View {
    
    var body: some View {
        GeometryReader{ geometory in
            VStack {
                Text("HOMEHOME ios")
            }
        }
    }
}

struct HomeMain_comp_ipad_iosH: View {
    @EnvironmentObject private var homeMainVM: HomeMainViewModel
    var body: some View {
        CalendarMain()
    }
}

fileprivate struct CalendarMain: View {
    @EnvironmentObject private var homeMainVM: HomeMainViewModel
    var body: some View {
            GeometryReader { geo in
                VStack {
                    HStack {
                        Button (action: {
                            homeMainVM.backMonth()
                        }, label: {
                            Image(systemName: "backward")
                        })
                        Spacer()
                        Text("\(homeMainVM.targetDate.yyyyMMdd_jp())")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Button (action: {
                            
                                homeMainVM.nextMonth()
                            
                        }, label: {
                            Image(systemName: "forward")
                        })
                    }
                    .padding(16)
                    
                    HStack(alignment: .top) {
                        if homeMainVM.isCalendar {
                            
                            CalendarView(columns: Array(repeating: .init(.fixed(geo.size.width / 12)), count: 7), targetDate: $homeMainVM.targetDate)
                            
                        }
                        Divider()
                        VStack {
                            HomeMain_PostList()
                        }
                        Spacer()
                    }
                }
            }
    }
}
