//
//  PostService.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/25.
//

import Foundation

enum PostService: ApiService {
    case create(PostCreateRequest)
    case homePostList(PostHomeListRequst)
}

extension PostService {
    
    var baseURL: String {
        let baseApi = Env["BASE_API"]
        
        guard let baseApi = baseApi else {
            return "http://localhost"
        }
        
        return baseApi
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .create:
            return .POST
        case .homePostList:
            return .GET
        }
    }
    
    var isAuth: Bool {
        return true
    }
    
    var path: String {
        switch self {
        case .create:
            return "/api/post/create"
        case .homePostList:
            return "/api/post/home-list"
        }
    }
    
    var requestType: RequestType{
        switch self {
        case let .create(request):
            return .requestBodyToJson(body: request)
        case .homePostList(let request):
            return .requestParametes(parameters: request.params())
        }
    }
}
