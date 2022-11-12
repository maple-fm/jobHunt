//
//  InterviewRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/12.
//

import Foundation
import RealmSwift


struct InterviewRepository {

    let realm = try! Realm()
    var model = InterviewModel()

    func create() {
        let interview = Interview(
            name: model.name ?? "",
            deadline: model.deadline ?? Date(),
            location: model.location ?? "",
            clothes: model.clothes ?? "",
            motivation: model.motivation ?? "",
            gakuchika: model.gakuchika ?? "",
            strongPoints: model.strongPoints ?? "",
            weakPoints: model.weakPoints ?? "",
            questions: model.questions ?? "",
            other: model.other ?? "",
            category: model.category ?? .interview)


        try! realm.write {
            realm.add(interview)
        }

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func isValidated() -> Bool {
        guard
            let name = model.name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
