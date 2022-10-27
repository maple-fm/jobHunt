//
//  HomeModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation
import RealmSwift

class HomeModel {
    
    var events: [ES] = [] 
    var eventDateArray : [String] = []

    let realm = try! Realm()
    let format = FormatModel()

    init() {
        getEvents()
        addEvents()
    }

    func getEvents() {
        events = Array(realm.objects(ES.self))
        addEvents()
    }

    // task: eventDateArrayをModelでもViewModelでも保持したくない
    // viewから
    func addEvents() {
        eventDateArray = []
        for event in events {
            eventDateArray.append(format.format(date: event.deadline))
        }
    }
}

