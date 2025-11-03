//
//  HomeViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/19.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var events: [any Entry] = []
    @Published var uid: String
    private var format = FormatRepository()
    private var repository: EventRepository
    
    // UID を受け取って初期化
    init(uid: String) {
        self.uid = uid
        self.repository = EventRepository(uid: uid)
        Task {
            await self.fetchEvents()
        }
    }
    
    // 非同期で Firestore からイベント取得
    func fetchEvents() async {
        self.events = await repository.getEvents()
    }
    
    // 今日のイベント日付リスト
    var eventsDateArray: [String] {
        events.map { format.formatDate(date: $0.eventTime) }
    }
    
    // 日付を文字列に変換
    func toString(date: Date) -> String {
        format.formatDate(date: date)
    }
    
    // 時刻を文字列に変換
    func toTime(date: Date) -> String {
        format.formatTime(date: date)
    }
    
    // 手動更新用
    func onUpdated() {
        Task {
            await fetchEvents()
        }
    }
}
