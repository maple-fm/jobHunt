//
//  DeleteRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/03.
//

import Foundation
import RealmSwift

struct DeleteRepository{

    let realm = try! Realm()

    func deleteES(id: String) {

        let target = realm.objects(ES.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }

    }

    func deleteInterview(id: String) {

        let target = realm.objects(Interview.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }


    }

    func deleteSession(id: String) {

        let target = realm.objects(Session.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

    func deleteInternship(id: String) {

        let target = realm.objects(Internship.self).filter("id == %@", id)

        try! realm.write{
            realm.delete(target)
        }
    }

    // TODO: 削除部分だけをまとめたい
//    private func delete<T>(target: T) {
//
//        print(target)
//        try! realm.write{
//            realm.delete(target)
//        }
//    }


}
