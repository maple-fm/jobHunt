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
    var category: EventName?

    func create() {
        let session = Session(name: name ?? "", deadline: deadline ?? Date(), location: location ?? "", clothes: clothes ?? "", item: item ?? "", questions: questions ?? "", other: other ?? "", category: category ?? .session)

        let realm = try! Realm()
        try! realm.write {
            realm.add(session)
        }
        
    }

    func isValidated() -> Bool {
        guard
            let name = name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
