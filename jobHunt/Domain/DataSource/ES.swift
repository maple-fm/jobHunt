//
//  ES.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class ES: Object, Entry {
    let uuid = UUID()
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

        self.id = self.uuid.uuidString
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

}
