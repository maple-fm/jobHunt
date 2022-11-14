//
//  HomeViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var repository: HomeRepository
    private var format = FormatRepository()

    @Published private(set) var events: [any Entry] = []
    var eventsDateArray: [String] {
        events.map {
            toString(date: $0.deadline)
        }
    }

    init() {
        repository = HomeRepository()
        assignEvents()
    }

    private func assignEvents() {
        session = sessionRepository.getSessions()
        // events = repository.model.events
    }

    func dismissActionSheet() {
        repository.getEvents()
        assignEvents()
    }

    func toString(date: Date) -> String {
        return format.format(date: date)
    }

    func toTime(date: Date) -> String {
        return format.formatTime(date: date)
    }
}
