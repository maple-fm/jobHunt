//
//  InternshipRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/12.
//

import Foundation
import RealmSwift

struct InternshipRepository {

    let realm = try! Realm()
    var model = InternshipModel()

    func create() {
        let internship = Internship(
            name: model.name ?? "",
            deadline: model.deadline ?? Date(),
            location: model.location ?? "",
            clothes: model.clothes ?? "",
            item: model.item ?? "",
            other: model.other ?? "",
            category: model.category ?? .internship)


        try! realm.write {
            realm.add(internship)
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
