//
//  SessionRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/12.
//

import Foundation
import RealmSwift

struct SessionRepository {

    let realm = try! Realm()
    var model = SessionModel()

    func create() {
        let session = Session(
            name: model.name ?? "",
            deadline: model.deadline ?? Date(),
            location: model.location ?? "",
            clothes: model.clothes ?? "",
            item: model.item ?? "",
            questions: model.questions ?? "",
            other: model.other ?? "",
            category: model.category ?? .session)

        try! realm.write {
            realm.add(session)
        }

    }

    func isValidated() -> Bool {
        guard
            let name = model.name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
