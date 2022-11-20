//
//  InterviewDataSource.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class InterviewDataSource: Object{

    @Persisted var id: String
    @Persisted var name: String
    @Persisted var deadline: Date
    @Persisted var location: String
    @Persisted var clothes: String
    @Persisted var motivation: String
    @Persisted var gakuchika: String
    @Persisted var strongPoints: String
    @Persisted var weakPoints: String
    @Persisted var questions: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, deadline: Date, location: String, clothes: String, motivation: String, gakuchika: String, strongPoints: String, weakPoints: String, questions: String, other: String, category: EventName) {
        
        self.id = UUID().uuidString
        self.name = name
        self.deadline = deadline
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
        self.init(name: "", deadline: Date.now, location: "", clothes: "", motivation: "", gakuchika: "", strongPoints: "", weakPoints: "", questions: "", other: "", category: .interview)
    }

    func write(datasource: InterviewDataSource) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(datasource)
        }
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

}
