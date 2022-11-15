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

    func saveNewSession(
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        item: String?,
        questions: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = SessionDataSource(
            name: name,
            deadline: deadline,
            location: location ?? "",
            clothes: clothes ?? "",
            item: item ?? "",
            questions: questions ?? "",
            other: other ?? "",
            category: category)

        try! realm.write {
            realm.add(datasource)
        }

    }

    func getSessionArrays() -> [SessionModel] {
        let datasources = Array(realm.objects(SessionDataSource.self).freeze())

        return datasources.map { datasource in
            SessionModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                questions: datasource.questions,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func deleteSession(id: String) {

        let target = realm.objects(SessionDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }
}
