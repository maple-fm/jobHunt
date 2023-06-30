//
//  SessionDataSource.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class SessionDataSource: Object{

    @Persisted var id: String
    @Persisted var name: String
    @Persisted var eventTime: Date
    @Persisted var location: String
    @Persisted var clothes: String
    @Persisted var item: String
    @Persisted var questions: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, start eventTime: Date, location: String, clothes: String, item: String, questions: String, other: String, category: EventName) {

        self.id = UUID().uuidString
        self.name = name
        self.eventTime = eventTime
        self.location = location
        self.clothes = clothes
        self.item = item
        self.questions = questions
        self.other = other
        self.category = category
    }

    convenience override init() {
        self.init(name: "", start: Date.now, location: "", clothes: "", item: "", questions: "", other: "", category: .session)
    }

    func write(datasource: SessionDataSource) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(datasource)
        }
    }

    func read() -> [SessionDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(SessionDataSource.self).freeze())

        return objectArray
    }

    func readOne(id: String) -> [SessionDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(SessionDataSource.self).filter("id == %@", id).freeze())

        return objectArray
    }

    func delete(id: String) {
        let realm = try! Realm()
        let target = realm.objects(SessionDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

    func edit(model: SessionModel) {
        let realm = try! Realm()
        guard
            let target = realm.objects(SessionDataSource.self).filter("id == %@", model.id).first
        else { return }

        try! realm.write {
            target.name = model.name
            target.eventTime = model.eventTime
            target.location = model.location ?? ""
            target.clothes = model.clothes ?? ""
            target.item = model.item ?? ""
            target.questions = model.questions ?? ""
            target.other = model.other ?? ""
        }
    }

}
