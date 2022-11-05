//
//  DeleteModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import RealmSwift

struct DeleteModel{

    let realm = try! Realm()

    func deleteES(id: String) {

        let targetES = realm.objects(ES.self).filter("id == %@", id)
        print("debug: \(targetES)")
        print("debug: \(id)")

        try! realm.write{
            realm.delete(targetES)
        }

    }

    func deleteInterview(id: String) {
        print(id)

//        let target = realm.objects(Interview.self).filter("id == \(id)")
    }

    func deleteSession(id: String) {
        print(id)

//        let target = realm.objects(Session.self).filter("id == \(id)")
    }

    func deleteInternship(id: String) {
        print(id)

//        let target = realm.objects(Internship.self).filter("id == \(id)")
    }



}
