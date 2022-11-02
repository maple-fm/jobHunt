//
//  HomeModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation
import RealmSwift

class HomeModel {
    
    var esArray: [ES] = []
    var interviewArray: [Interview] = []
    var events: [any Entry] = []

    let realm = try! Realm()
    let format = FormatModel()

    init() {
        getEvents()
    }

    func getEvents() {
        esArray = Array(realm.objects(ES.self))
        interviewArray = Array(realm.objects(Interview.self))
        events = esArray + interviewArray

    }
}

