//
//  PostHomeListRequest.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/27.
//

import Foundation

struct PostHomeListRequst {
    var year: Int
    var month: Int
    
    func params() -> [URLQueryItem] {
        let queryItems = [
            URLQueryItem(name: "year", value: String(year)),
            URLQueryItem(name: "month", value: String(month))
        ]
        
        return queryItems
    }
}
