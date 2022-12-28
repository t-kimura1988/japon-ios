//
//  PostCreateView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/25.
//

import SwiftUI
import Combine

struct PostCreateView: View {
    @EnvironmentObject private var postCreateVM: PostCreateViewModel
    
    @Environment(\.dismiss) var dismiss
    @FocusState var focus: Bool
    
    let maxLength: Int = 1000
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("\(postCreateVM.postBody.count)文字 / \(maxLength)文字まで")
                        .foregroundColor(.gray)
                    TextEditor(text: $postCreateVM.postBody)
                        .focused($focus)
                        .onReceive(Just(postCreateVM.postBody)) {_ in
                            if postCreateVM.postBody.count > maxLength {
                                postCreateVM.postBody = String(postCreateVM.postBody.prefix(maxLength))
                            }
                        }
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {dismiss()}, label: {Text("閉")})
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(
                                    action: {
                                        postCreateVM.save(text: postCreateVM.postBody, comp: {
                                            dismiss()
                                        })
                                    },
                                    label: {Text("保存")}
                                ).disabled(!postCreateVM.isSaveButton)
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
        .onAppear{
            postCreateVM.initValidate()
        }
    }
}

struct PostCreateView_Previews: PreviewProvider {
    static var previews: some View {
        PostCreateView()
    }
}
