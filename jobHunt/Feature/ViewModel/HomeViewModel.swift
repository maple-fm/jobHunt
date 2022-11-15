//
//  HomeViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {

    private var useCase = HomeUseCase()
    private var format = FormatRepository()

    @Published private(set) var events: [any Entry] = []
    var eventsDateArray: [String] {
        events.map {
            toString(date: $0.deadline)
        }
    }

    init() {
//        repository = getEventsRepository()
        assignEvents()
    }

    private func assignEvents() {
        events = useCase.getEvents()
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
