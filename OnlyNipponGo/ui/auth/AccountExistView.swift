//
//  AccountExistView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import SwiftUI

struct AccountExistView: View {
    @EnvironmentObject var vm: AccountExistViewModel
    var body: some View {
        switch vm.state {
        case .Loading: SignInLoadingView()
        case .SignOut: UnAuthView()
        case .SignIn: HomeTabBarView()
        }
    }
}

struct AccountExistView_Previews: PreviewProvider {
    static var previews: some View {
        AccountExistView()
    }
}
