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

    func saveNewInternship(
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        item: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = InternshipDataSource(
            name: name,
            deadline: deadline,
            location: location ?? "",
            clothes: clothes ?? "",
            item: item ?? "",
            other: other ?? "",
            category: category)


        try! realm.write {
            realm.add(datasource)
        }
    }

    func getInternshipArrays() -> [InternshipModel] {
        let datasources = Array(realm.objects(InternshipDataSource.self).freeze())

        return datasources.map { datasource in
            InternshipModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                item: datasource.item,
                other: datasource.other,
                category: datasource.category
            )
        }
    }

    func deleteInternship(id: String) {

        let target = realm.objects(InternshipDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }
}
