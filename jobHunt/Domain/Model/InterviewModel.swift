//
//  InterviewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import RealmSwift


// 面談・面接
class InterviewModel: Entry {

    var id: String
    var name: String
    var deadline: Date
    var endDeadline: Date?
    var flow: Flow
    var location: String?
    var clothes: String?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var questions: String?
    var other: String?
    var category: EventName

    init(
        id: String,
        name: String,
        deadline: Date,
        endDeadline: Date,
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
        self.id = id
        self.name = name
        self.deadline = deadline
        self.endDeadline = endDeadline
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
