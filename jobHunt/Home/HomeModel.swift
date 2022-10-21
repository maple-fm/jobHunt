//
//  HomeModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation
import RealmSwift

class HomeModel {
    let dateFormatter = DateFormatter()
    var events: [ES] = [] 
    var eventDateArray : [String] = []

    let realm = try! Realm()

    init() {
        getEvents()
        AddEvents()
    }

    func getEvents() {
        events = Array(realm.objects(ES.self))
        AddEvents()
    }

    func format(date: Date) -> String {
        dateFormatter.dateFormat = "YYYY年MM月dd日"
        return dateFormatter.string(from:date)
    }

    func AddEvents() {
        for event in events {
            eventDateArray.append(format(date: event.deadline))
        }
    }
}

