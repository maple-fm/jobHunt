//
//  Internship.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

class Internship: Object, Entry {
    let id = UUID()
    @Persisted var name: String
    @Persisted var deadline: Date
    @Persisted var location: String
    @Persisted var clothes: String
    @Persisted var item: String
    @Persisted var other: String
    @Persisted var category: EventName

    init(name: String, deadline: Date, location: String, clothes: String, item: String, other: String, category: EventName) {
        self.name = name
        self.deadline = deadline
        self.location = location
        self.clothes = clothes
        self.item = item
        self.other = other
        self.category = category
    }

    convenience override init() {
        self.init(name: "", deadline: Date.now, location: "", clothes: "", item: "", other: "", category: .internship)
    }

}
