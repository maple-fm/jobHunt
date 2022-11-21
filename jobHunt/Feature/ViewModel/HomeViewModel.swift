//
//  HomeViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {

    private var repository = EventRepository()
    private var format = FormatRepository()

    @Published private(set) var events: [any Entry] = []
    var eventsDateArray: [String] {
        events.map {
            toString(date: $0.deadline)
        }
    }

    init() {
        assignEvents()
    }

    private func assignEvents() {
        events = repository.getEvents()
    }

    func dismissActionSheet() {
        assignEvents()
    }

    func toString(date: Date) -> String {
        return format.formatDate(date: date)
    }

    func toTime(date: Date) -> String {
        return format.formatTime(date: date)
    }
}
