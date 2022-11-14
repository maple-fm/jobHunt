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
    // var model = SessionModel()

    func saveNewSession(
        var name: String
        var deadline: Date?
        var location: String?
        var clothes: String?
        var item: String?
        var questions: String?
        var other: String?
        var category: EventName?
    ) {
        let datasource = SessionDataSource(
            name: model.name ?? "",
            deadline: model.deadline ?? Date(),
            location: model.location ?? "",
            clothes: model.clothes ?? "",
            item: model.item ?? "",
            questions: model.questions ?? "",
            other: model.other ?? "",
            category: model.category ?? .session)

        try! realm.write {
            realm.add(datasource)
        }
    }

    func getSessions() -> [SessionModel] {
        let datasources = Array(realm.objects(SessionDataSource.self).freeze())
        
        return datasources.map { datasource in
            SessionModel(
                name: datasource.name,
                deadline: datasource.deadline
            )
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
