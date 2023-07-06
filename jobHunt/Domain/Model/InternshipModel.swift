//
//  InternshipModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation

// インターンシップ
struct InternshipModel: Entry {
    
    var id: String
    var name: String
    var eventTime: Date
    var endTime: Date?
    var location: String?
    var clothes: String?
    var item: String?
    var other: String?
    var category: EventName

    init(id: String, name: String, start eventTime: Date, end endTime: Date, location: String?, clothes: String?, item: String?, other: String?, category: EventName) {
        self.id = id
        self.name = name
        self.eventTime = eventTime
        self.endTime = endTime
        self.location = location
        self.clothes = clothes
        self.item = item
        self.other = other
        self.category = category
    }

}
