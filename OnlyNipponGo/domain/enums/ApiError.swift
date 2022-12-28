//
//  ApiError.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/19.
//

import Foundation

enum ApiError: Error {
    case invalidURL,
         responseError(String),
         httpError(Int),
         parseError,
         unknown
    
}

extension ApiError {
    
}
