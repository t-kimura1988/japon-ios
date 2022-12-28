//
//  HomeMainView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/21.
//

import SwiftUI

struct HomeMainView: View {
    
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    
    @EnvironmentObject private var homeMainVM: HomeMainViewModel
    
    var body: some View {
        let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
        ZStack {
            switch deviceTraitStatus {
            case .wRhR, .wChC, .wRhC:
                HomeMain_comp_ipad_iosH()
            case .wChR:
                HomeMain_comp_iosV()
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        homeMainVM.openPostSheet()
                    }, label: {
                        Text("閃")
                            .foregroundColor(.white)
                    })
                    .frame(width: 50, height: 50)
                    .background(.orange)
                    .clipShape(Circle())
                    .offset(x: -40, y: -70)
                }
            }
        }
        .sheet(isPresented: $homeMainVM.isPostSheet) {
            PostCreateView()
                .environmentObject(PostCreateViewModel())
        }
    }
}

struct HomeMainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainView()
    }
}
