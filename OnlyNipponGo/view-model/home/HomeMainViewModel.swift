//
//  HomeMainViewModel.swift
//  OnlyNipponGo
//
//  Created by 木村猛 on 2022/12/25.
//

import Foundation
import Combine

class HomeMainViewModel: ObservableObject {
    @Published var isPostSheet = false
    @Published var isCalendar = true
    @Published var targetDate: Date = Date()
    
    private var postRespository: PostRepository = PostRepository()
    
    func openPostSheet() {
        isPostSheet = true
    }
    
    func closePostSheet() {
        isPostSheet = false
    }
    
    func changeCalendarFlg() {
        isCalendar = !isCalendar
    }
    
    func nextMonth() {
        targetDate = Calendar.current.date(byAdding: .month, value: 1, to: targetDate)!
    }
    
    func backMonth() {
        targetDate = Calendar.current.date(byAdding: .month, value: -1, to: targetDate)!
    }
    
    func getPosts() {
        Task {
            var res = try await postRespository.homePostList(request: .init(year: getCalendar().year!, month: getCalendar().month!))
            
            
        }
    }
    
    private func getCalendar() -> DateComponents{
        let calendar = Calendar(identifier: .gregorian)
        return calendar.dateComponents([.year, .month], from: targetDate)
    }
    
    func getPostDetail() {
        Task {
            
        }
    }
}
