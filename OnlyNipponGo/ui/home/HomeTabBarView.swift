//
//  HomeTabView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/20.
//

import SwiftUI

struct HomeTabBarView: View {
    
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    
    var body: some View {
        
        let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
        
        switch deviceTraitStatus {
        case .wRhR, .wChC, .wRhC:
            HomeTab_H()
        case .wChR:
            HomeTab_Ios_V()
        }
    }
}

struct HomeTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabBarView()
    }
}
