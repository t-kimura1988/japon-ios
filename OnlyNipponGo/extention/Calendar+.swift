//
//  Calendar+.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/22.
//

import Foundation

extension Calendar {
    // その月の開始日
    func startOfMonth(for date: Date) -> Date? {
        let comps = dateComponents([.month, .year], from: date)
        return self.date(from: comps)
    }
    
    // その月の日数
    func daysInMonth(for date: Date) -> Int? {
        return range(of: .day, in: .month, for: date)?.count
    }
    
    // その月の週数
    func weeksInMonth(for date: Date) -> Int? {
        return range(of: .weekOfMonth, in: .month, for: date)?.count
    }
    
    func year(for date: Date) -> Int? {
        let comps = dateComponents([.year], from: date)
        print(comps.year)
        return comps.year
    }
    
    func month(for date: Date) -> Int? {
        let comps = dateComponents([.month], from: date)
        return comps.month
    }
    
    func day(for date: Date) -> Int? {
        let comps = dateComponents([.day], from: date)
        return comps.day
    }
    
    func weekday(for date: Date) -> Int? {
        let comps = dateComponents([.weekday], from: date)
        return comps.weekday
    }
    
}
