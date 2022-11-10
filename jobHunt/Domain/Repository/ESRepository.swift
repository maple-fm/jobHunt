//
//  ESRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/10.
//

import Foundation
import RealmSwift

struct ESRepository {

    let realm = try! Realm()
    var model = ESModel()


    func create() {
        let es = ES(name: model.name ?? "", deadline: model.deadline ?? Date(), motivation: model.motivation ?? "", gakuchika: model.gakuchika ?? "", strongPoints: model.strongPoints ?? "", weakPoints: model.weakPoints ?? "", other: model.other ?? "", category: model.category ?? .es)

        try! realm.write {
            realm.add(es)
        }

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    // TODO: この関数を一つのファイル内にまとめる
    func isValidated() -> Bool {
        guard
            let name = model.name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
