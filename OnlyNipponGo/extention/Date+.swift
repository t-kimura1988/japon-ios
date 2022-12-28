//
//  Date+.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/27.
//

import Foundation

extension Date {
    
    func yyyyMMdd_jp() -> String {
        return toString(format: "yyyy年MM月")
    }
    
    func toString(format: String) -> String{
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
