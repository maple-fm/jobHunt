//
//  HomeViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/19.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var homeModel = HomeModel()
    private var format = FormatModel()

    @Published private(set) var events: [ES] = []
    @Published var eventDateArray : [String] = []

    init() {
        assignEvents()
    }

    private func assignEvents() {
        events = homeModel.events
        eventDateArray = homeModel.eventDateArray
    }

    func dismissActionSheet() {
        homeModel.getEvents()
        assignEvents()
    }

    func toString(date: Date) -> String {
        return format.format(date: date)
    }
}
