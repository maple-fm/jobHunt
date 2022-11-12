//
//  HomeRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/09.
//

import Foundation
import RealmSwift

class HomeRepository {
    let model = HomeModel()

    init() {
        getEvents()
    }

    func getEvents(){
        let realm = try! Realm()
        // freeze()を使って解消した→freeze()とは
        // このままでも編集ができるのか？
        model.esArray = Array((realm.objects(ES.self).freeze()))
        model.interviewArray = Array(realm.objects(Interview.self).freeze())
        model.sessionArray = Array(realm.objects(Session.self).freeze())
        model.internshipArray = Array(realm.objects(Internship.self).freeze())

        model.events = model.esArray + model.interviewArray + model.sessionArray + model.internshipArray
        model.events.sort(by: {$0.deadline < $1.deadline})
    }
}
