//
//  InternshipDataSource.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class InternshipDataSource: Object{


    @Persisted var id: String
    @Persisted var name: String
    @Persisted var eventTime: Date
    @Persisted var endTime: Date
    @Persisted var location: String
    @Persisted var clothes: String
    @Persisted var item: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, start eventTime: Date, end endTime: Date, location: String, clothes: String, item: String, other: String, category: EventName) {
        
        self.id = UUID().uuidString
        self.name = name
        self.eventTime = eventTime
        self.endTime = endTime
        self.location = location
        self.clothes = clothes
        self.item = item
        self.other = other
        self.category = category
    }

    convenience override init() {
        self.init(name: "", start: Date.now, end: Date.now, location: "", clothes: "", item: "", other: "", category: .internship)
    }

    func write(datasource: InternshipDataSource) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(datasource)
        }
    }

    func read() -> [InternshipDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(InternshipDataSource.self).freeze())

        return objectArray
    }

    func readOne(id: String) -> [InternshipDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(InternshipDataSource.self).filter("id == %@", id).freeze())

        return objectArray
    }

    func delete(id: String) {
        let realm = try! Realm()
        let target = realm.objects(InternshipDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

    func edit(model: InternshipModel) {
        let realm = try! Realm()
        guard
            let target = realm.objects(InternshipDataSource.self).filter("id == %@", model.id).first
        else { return }

        try! realm.write {
            target.name = model.name
            target.eventTime = model.eventTime
            target.endTime = model.endTime ?? model.eventTime
            target.location = model.location ?? ""
            target.clothes = model.clothes ?? ""
            target.item = model.item ?? ""
            target.other = model.other ?? ""
        }
    }

}
