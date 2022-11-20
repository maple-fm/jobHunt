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
    @Persisted var deadline: Date
    @Persisted var location: String
    @Persisted var clothes: String
    @Persisted var item: String
    @Persisted var questions: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, deadline: Date, location: String, clothes: String, item: String, questions: String, other: String, category: EventName) {

        self.id = UUID().uuidString
        self.name = name
        self.deadline = deadline
        self.location = location
        self.clothes = clothes
        self.item = item
        self.questions = questions
        self.other = other
        self.category = category
    }

    convenience override init() {
        self.init(name: "", deadline: Date.now, location: "", clothes: "", item: "", questions: "", other: "", category: .session)
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

    func delete(id: String) {
        let realm = try! Realm()
        let target = realm.objects(SessionDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

}
