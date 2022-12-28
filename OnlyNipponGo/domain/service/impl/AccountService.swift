//
//  AccountService.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

enum AccountService: ApiService {
    
    case existAccount
    case createAccount(AccountCreateRequest)
    case updateAccount(AccountCreateRequest)
    case deleteAccount
}

extension AccountService {
    var baseURL: String {
        let baseApi = Env["BASE_API"]
        
        guard let baseApi = baseApi else {
            return "http://localhost"
        }
        
        return baseApi
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .existAccount:
            return .GET
        case .createAccount, .updateAccount, .deleteAccount:
            return .POST
        }
    }
    
    var isAuth: Bool {
        return true
    }
    
    var path: String {
        switch self {
        case .existAccount:
            return "/api/user/show"
        case .createAccount:
            return "/api/user/create"
        case .updateAccount:
            return "/api/user/update"
        case .deleteAccount:
            return "/api/user/delete"
        }
    }
    
    var requestType: RequestType{
        switch self {
        case .existAccount:
               return .requestParametes(parameters: [])
        case let .createAccount(encodable):
            return .requestBodyToJson(body: encodable)
        case let .updateAccount(request):
            return .requestBodyToJson(body: request)
        case .deleteAccount:
            return .request
        }
    }
}
