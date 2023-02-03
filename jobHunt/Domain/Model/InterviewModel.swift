//
//  InterviewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation


struct InterviewModel: Entry {

    var id: String
    var name: String
    var deadline: Date
    var location: String?
    var clothes: String?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var questions: String?
    var other: String?
    var category: EventName

    init(id: String, name: String, deadline: Date, location: String?, clothes: String?, motivation: String?, gakuchika: String?, strongPoints: String?, weakPoints: String?, questions: String?, other: String?, category: EventName) {
        self.id = id
        self.name = name
        self.deadline = deadline
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
