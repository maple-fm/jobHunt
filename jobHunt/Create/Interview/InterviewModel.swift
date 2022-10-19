//
//  InterviewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import RealmSwift

struct InterviewModel {

    var name: String?
    var deadline: Date?
    var location: String?
    var clothes: String?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?

    init(name: String? = nil, deadline: Date? = nil, location: String? = nil, clothes: String? = nil, motivation: String? = nil, gakuchika: String? = nil, strongPoints: String? = nil, weakPoints: String? = nil, other: String? = nil) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        self.name = name
        self.deadline = deadline
        self.location = location
        self.clothes = clothes
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.other = other
    }

    func create() {
        print("Interview")
        print(self.name ?? "名無し")
    }

    func isValidated() -> Bool {
        guard
            let name = name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
}
