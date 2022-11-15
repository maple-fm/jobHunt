//
//  ESRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/10.
//

import Foundation
import RealmSwift

// TODO: 関数が一緒ならプロトコルで保持するべき？
struct ESRepository {

    let realm = try! Realm()

    func saveNewES(
        name: String,
        deadline: Date,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = ESDataSource(
            name: name,
            deadline: deadline,
            motivation: motivation ?? "",
            gakuchika: gakuchika ?? "",
            strongPoints: strongPoints ?? "",
            weakPoints: weakPoints ?? "",
            other: other ?? "",
            category: category)

        try! realm.write {
            realm.add(datasource)
        }

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func getESArrays() -> [ESModel] {
        let datasources = Array(realm.objects(ESDataSource.self).freeze())

        return datasources.map { datasource in
            ESModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                motivation: datasource.motivation,
                gakuchika: datasource.gakuchika,
                strongPoints: datasource.strongPoints,
                weakPoints: datasource.weakPoints,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func deleteES(id: String) {

        let target = realm.objects(ESDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }

    }

}
