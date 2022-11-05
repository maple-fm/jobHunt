//
//  ESModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation
import RealmSwift

struct ESModel {
    
    var name: String?
    var deadline: Date?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?
    var category: EventName?

    func create() {
        let es = ES(name: name ?? "", deadline: deadline ?? Date(), motivation: motivation ?? "", gakuchika: gakuchika ?? "", strongPoints: strongPoints ?? "", weakPoints: weakPoints ?? "", other: other ?? "", category: category ?? .es)
        let realm = try! Realm()
        try! realm.write {
            realm.add(es)
        }

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    // TODO: この関数を一つのファイル内にまとめる
    func isValidated() -> Bool {
        guard
            let name = name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
