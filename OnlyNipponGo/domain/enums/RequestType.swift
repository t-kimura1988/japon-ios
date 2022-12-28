//
//  RequestType.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

enum RequestType {
    case requestParametes(parameters: [URLQueryItem])
    case requestBodyToJson(body: Encodable)
    case request
}
