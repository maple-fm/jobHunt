//
//  InterviewDataSource.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class InterviewDataSource: Object {

    @Persisted var id: String
    @Persisted var name: String
    @Persisted var deadline: Date
    @Persisted var endDeadline: Date
    @Persisted var flow: Flow
    @Persisted var location: String
    @Persisted var clothes: String
    @Persisted var motivation: String
    @Persisted var gakuchika: String
    @Persisted var strongPoints: String
    @Persisted var weakPoints: String
    @Persisted var questions: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, deadline: Date, endDeadline: Date, flow: Flow, location: String, clothes: String, motivation: String, gakuchika: String, strongPoints: String, weakPoints: String, questions: String, other: String, category: EventName) {
        
        self.id = UUID().uuidString
        self.name = name
        self.deadline = deadline
        self.endDeadline = endDeadline
        self.flow = flow
        self.location = location
        self.clothes = clothes
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.questions = questions
        self.other = other
        self.category = category

    }

    convenience override init() {
        self.init(name: "", deadline: Date.now, endDeadline: Date.now + 1, flow: .first, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview)
    }

    func write(datasource: InterviewDataSource) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(datasource)
        }
    }

    func readOne(id: String) -> [InterviewDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(InterviewDataSource.self).filter("id == %@", id).freeze())

        return objectArray
    }

    func read() -> [InterviewDataSource] {
        let realm = try! Realm()
        let objectArray = Array(realm.objects(InterviewDataSource.self).freeze())

        return objectArray
    }

    func delete(id: String) {
        let realm = try! Realm()
        let target = realm.objects(InterviewDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

    func edit(model: InterviewModel) {
        let realm = try! Realm()
        guard
            let target = realm.objects(InterviewDataSource.self).filter("id == %@", model.id).first
        else { return }

        try! realm.write {
            target.name = model.name
            target.deadline = model.deadline
            target.flow = model.flow
            target.location = model.location ?? ""
            target.clothes = model.clothes ?? ""
            target.motivation = model.motivation ?? ""
            target.gakuchika = model.gakuchika ?? ""
            target.strongPoints = model.strongPoints ?? ""
            target.weakPoints = model.weakPoints ?? ""
            target.questions = model.questions ?? ""
            target.other = model.other ?? ""
        }
    }

}
