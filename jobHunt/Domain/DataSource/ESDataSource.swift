//
//  ESDataSource.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class ESDataSource: Object {
    
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var deadline: Date
    @Persisted var motivation: String
    @Persisted var gakuchika: String
    @Persisted var strongPoints: String
    @Persisted var weakPoints: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, deadline: Date, motivation: String, gakuchika: String, strongPoints: String, weakPoints: String, other: String, category: EventName) {

        self.id = UUID().uuidString
        self.name = name
        self.deadline = deadline
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.other = other
        self.category = category

    }

    convenience override init() {
        self.init(name: "", deadline: Date.now, motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", other: "", category: .es)
    }

    func write(datasource: ESDataSource) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(datasource)
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func read() -> [ESDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(ESDataSource.self).freeze())

        return objectArray
    }

    func readOne(id: String) -> [ESDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(ESDataSource.self).filter("id == %@", id).freeze())

        return objectArray
    }

    func delete(id: String) {
        let realm = try! Realm()
        let target = realm.objects(ESDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

    func edit(model: ESModel) {
        let realm = try! Realm()
        guard
            let target = realm.objects(ESDataSource.self).filter("id == %@", model.id).first
        else { return }

        try! realm.write {
            target.name = model.name
            target.motivation = model.motivation ?? ""
            target.gakuchika = model.gakuchika ?? ""
            target.strongPoints = model.strongPoints ?? ""
            target.weakPoints = model.weakPoints ?? ""
            target.other = model.other ?? ""
        }
    }
}
