//
//  InterviewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import RealmSwift


// 面談・面接
class InterviewModel: Object, Entry {

    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var deadline: Date
    dynamic var flow: Flow
    @objc dynamic var location: String?
    @objc dynamic var clothes: String?
    @objc dynamic var motivation: String?
    @objc dynamic var gakuchika: String?
    @objc dynamic var strongPoints: String?
    @objc dynamic var weakPoints: String?
    @objc dynamic var questions: String?
    @objc dynamic var other: String?
    dynamic var category: EventName

    required override init() {
        self.id = ""
        self.name = ""
        self.deadline = Date()
        self.flow = .first
        self.location = ""
        self.clothes = ""
        self.motivation = ""
        self.gakuchika = ""
        self.strongPoints = ""
        self.weakPoints = ""
        self.questions = ""
        self.other = ""
        self.category = .interview
        super.init()
    }

    convenience init(
        id: String,
        name: String,
        deadline: Date,
        flow: Flow,
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

        self.init()
        self.id = id
        self.name = name
        self.deadline = deadline
        self.flow = flow
        self.location = location
        self.clothes = clothes
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.questions = questions
        self.other = other
        self.category = category
    }
}

enum Flow: String, CaseIterable, PersistableEnum {
    case first = "1次"
    case second = "2次"
    case third = "3次"
    case fourth = "4次"
    case final = "最終"
}
