//
//  PostCreateViewModel.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/25.
//

import Combine

class PostCreateViewModel: ObservableObject {
    @Published var postBody: String = ""
    @Published var isSaveButton: Bool = false
    
    var postRepository: PostRepository = PostRepository()
    
    func initValidate() {
        let postBodyVali = $postBody.map({ !$0.isEmpty  }).eraseToAnyPublisher()
        
        postBodyVali
            .assign(to: &$isSaveButton)
    }
    
    func save(text: String, comp: @escaping () -> Void) {
        Task {
            var _ = try await postRepository.create(request: .init(postBody: text))
            comp()
        }
    }
    
    
}
