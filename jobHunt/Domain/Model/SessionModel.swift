//
//  SessionModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation

// 説明会
struct SessionModel: Entry {
    
    var id: String
    var name: String
    var deadline: Date
    var endDeadline: Date?
    var location: String?
    var clothes: String?
    var item: String?
    var questions: String?
    var other: String?
    var category: EventName

    init(id: String, name: String, deadline: Date, location: String?, clothes: String?, item: String?, questions: String?, other: String?, category: EventName) {
        self.id = id
        self.name = name
        self.deadline = deadline
        self.location = location
        self.clothes = clothes
        self.item = item
        self.questions = questions
        self.other = other
        self.category = category
    }


}
