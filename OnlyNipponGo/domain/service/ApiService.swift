//
//  ApiService.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

protocol ApiService {
    var requestType: RequestType { get }
    var baseURL: String {get}
    var httpMethod: HttpMethod {get}
    var isAuth: Bool {get}
    var path: String { get }
}
