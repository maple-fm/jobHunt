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

    func saveNesInterview(
        name: String,
        deadline: Date,
        location: String?,
        clothes: String?,
        motivation: String?,
        gakuchika: String?,
        strongPoints: String?,
        weakPoints: String?,
        questions: String?,
        other: String?,
        category: EventName
    ) {
        let datasource = InterviewDataSource(
            name: name,
            deadline: deadline,
            location: location ?? "",
            clothes: clothes ?? "",
            motivation: motivation ?? "",
            gakuchika: gakuchika ?? "",
            strongPoints: strongPoints ?? "",
            weakPoints: weakPoints ?? "",
            questions: questions ?? "",
            other: other ?? "",
            category: category)


        try! realm.write {
            realm.add(datasource)
        }

        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    func getInterviewArrays() -> [InterviewModel] {
        let datasources = Array(realm.objects(InterviewDataSource.self).freeze())

        return datasources.map { datasource in
            InterviewModel(
                id: datasource.id,
                name: datasource.name,
                deadline: datasource.deadline,
                location: datasource.location,
                clothes: datasource.clothes,
                motivation: datasource.motivation,
                gakuchika: datasource.gakuchika,
                strongPoints: datasource.strongPoints,
                weakPoints: datasource.weakPoints,
                questions: datasource.questions,
                other: datasource.other,
                category: datasource.category)
        }
    }

    func deleteInterview(id: String) {

        let target = realm.objects(InterviewDataSource.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

}
