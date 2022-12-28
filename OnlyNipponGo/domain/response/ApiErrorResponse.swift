//
//  ApiErrorResponse.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

struct ApiErrorResponse: Decodable, Error {
    var code: Int = 0
    var message: String = ""
    var errorCd: String? = ""
}
