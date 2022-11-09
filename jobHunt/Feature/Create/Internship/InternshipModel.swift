//
//  InternshipModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import RealmSwift

struct InternshipModel {

    var name: String?
    var deadline: Date?
    var location: String?
    var clothes: String?
    var item: String?
    var other: String?
    var category: EventName?


    func create() {
        let internship = Internship(name: name ?? "", deadline: deadline ?? Date(), location: location ?? "", clothes: clothes ?? "", item: item ?? "", other: other ?? "", category: category ?? .internship)

        let realm = try! Realm()
        try! realm.write {
            realm.add(internship)
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
