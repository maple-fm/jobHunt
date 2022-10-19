//
//  SessionModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import RealmSwift

struct SessionModel {

    var name: String?
    var deadline: Date?
    var location: String?
    var clothes: String?
    var item: String?
    var questions: String?
    var other: String?

    init(name: String? = nil, deadline: Date? = nil, location: String? = nil, clothes: String? = nil, item: String? = nil, questions: String? = nil, other: String? = nil) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        self.name = name
        self.deadline = deadline
        self.location = location
        self.clothes = clothes
        self.item = item
        self.questions = questions
        self.other = other
    }

    func create() {
        print("Session")
        print(self.name ?? "名無し")
        
    }

    func isValidated() -> Bool {
        guard
            let name = name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
