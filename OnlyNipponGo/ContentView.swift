//
//  ContentView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AccountExistView()
            .environmentObject(AccountExistViewModel())
            .environmentObject(HomeMainViewModel())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
