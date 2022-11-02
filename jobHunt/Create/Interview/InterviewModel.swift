//
//  InterviewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import RealmSwift

struct InterviewModel {

    var name: String?
    var deadline: Date?
    var location: String?
    var clothes: String?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?
    var category: EventName?

    func create() {
        let interview = Interview(name: name ?? "", deadline: deadline ?? Date(), location: location ?? "", clothes: clothes ?? "", motivation: motivation ?? "", gakuchika: gakuchika ?? "", strongPoints: strongPoints ?? "", weakPoints: weakPoints ?? "", other: other ?? "", category: category ?? .interview)

        let realm = try! Realm()
        try! realm.write {
            print(interview)
            realm.add(interview)
        }

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func isValidated() -> Bool {
        guard
            let name = name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
