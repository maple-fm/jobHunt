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

    @Published private(set) var events: [ES] = []
    @Published var eventDateArray : [String] = []

    init() {
        assignEvents()
    }

    func assignEvents() {
        events = homeModel.events
        eventDateArray = homeModel.eventDateArray
    }

    func getEvents() {
        homeModel.getEvents()
    }

    func dismissActionSheet() {
        getEvents()
        assignEvents()
    }

    func toString(date: Date) -> String {

        return homeModel.format(date: date)
    }
}
