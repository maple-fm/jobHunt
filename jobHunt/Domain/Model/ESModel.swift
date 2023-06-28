//
//  ESModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation

// エントリーシート
struct ESModel: Entry {
    
    var id: String
    var name: String
    var eventTime: Date
    var endTime: Date?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?
    var category: EventName

    init(id: String, name: String, deadline: Date, motivation: String?, gakuchika: String?, strongPoints: String?, weakPoints: String?, other: String?, category: EventName) {
        self.id = id
        self.name = name
        self.eventTime = deadline
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.other = other
        self.category = category
    }

}
