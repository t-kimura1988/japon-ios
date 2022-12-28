//
//  JaponEditerView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/25.
//

import SwiftUI
import Combine

struct JaponEditerView: View {
    @State var text: String
    @State var isSave: Bool
    @FocusState var focus: Bool
    var changeText: (String) -> Void
    var close: () -> Void
    private var maxTextSize: Int = 0
    private var isNewLine: Bool = true
    
    
    init(text: String, maxSize: Int, isNewLine: Bool = true, isSave: Bool = false, changeText: @escaping (String) -> Void, close: @escaping () -> Void) {
        self.text = text
        self.changeText = changeText
        self.maxTextSize = maxSize
        self.isNewLine = isNewLine
        self.close = close
        self.isSave = isSave
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(text.count)文字 / \(maxTextSize)文字まで")
                    .foregroundColor(.gray)
                TextEditor(text: $text)
                    .focused($focus)
                    .onReceive(Just(text)) {_ in
                        if !isNewLine {
                            text = text.trimmingCharacters(in: .newlines)
                        }
                        if text.count > maxTextSize {
                            text = String(text.prefix(maxTextSize))
                        }
                    }
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {close()}, label: {Text("閉")})
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(
                                action: {changeText(text)},
                                label: {Text("保存")}
                            ).disabled(!isSave)
                        }
                    }
            }
            .navigationTitle(Text("編集"))
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                focus = true
            }
        }
        .navigationViewStyle(.stack)
    }
}
