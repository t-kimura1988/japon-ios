//
//  CalendarView.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/22.
//

import SwiftUI

struct CalendarView: View {
    @Binding var targetDate: Date
    var columns: [GridItem] = Array(repeating: .init(.fixed(50)), count: 7)
    
    
    init(columns: [GridItem], targetDate: Binding<Date>) {
        self.columns = columns
        self._targetDate = targetDate
    }
    
    
    var body: some View {
        // 日付配列
        let calendarDates = createDates(targetDate)
        
        LazyVGrid(columns: columns, spacing: 0.5) {
            ForEach(calendarDates) { calendarDates in
                VStack {
                    if let date = calendarDates.date, let day = Calendar.current.day(for: date) {
                        
                        Text("\(day)")
                            .fontWeight(.bold)
                        Text("AAAA AAAAA BBBBBBBBBBBB")
                            .font(.caption)
                            .lineLimit(1)
                        Text("AAAA AAAAA BBBBBBBBBBBB")
                            .font(.caption)
                            .lineLimit(1)
                        Text("AAAA AAAAA BBBBBBBBBBBB")
                            .font(.caption)
                            .lineLimit(1)
                    } else {
                        Text("")
                    }
                    
                }
            }
        }
    }
    
    func createDates(_ date: Date) -> [CalendarDates] {
        var days = [CalendarDates]()
        
        let startOfMonth = Calendar.current.startOfMonth(for: date)
        let daysInMonth = Calendar.current.daysInMonth(for: date)
        
        guard let daysInMonth = daysInMonth, let startOfMonth = startOfMonth else { return []}
        
        for day in 0..<daysInMonth {
            days.append(CalendarDates(date: Calendar.current.date(byAdding: .day, value: day, to: startOfMonth)))
        }
        
        
        
        guard let firstDay = days.first, let lastDay = days.last,
              let firstDate = firstDay.date, let lastDate = lastDay.date,
              let firstDateWeekday = Calendar.current.weekday(for: firstDate),
              let lastDateWeekday = Calendar.current.weekday(for: lastDate) else { return [] }
        // 初週のオフセット日数
        let firstWeekEmptyDays = firstDateWeekday - 1
        // 最終週のオフセット日数
        let lastWeekEmptyDays = 7 - lastDateWeekday
        // 初週のオフセットを追加
        for _ in 0..<firstWeekEmptyDays {
            days.insert(CalendarDates(date: nil), at: 0)
        }

        // 最終週のオフセットを追加
        for _ in 0..<lastWeekEmptyDays {
            days.append(CalendarDates(date: nil))
        }
        return days
    }
}

struct CalendarDates: Identifiable {
    var id = UUID()
    var date: Date?
}
