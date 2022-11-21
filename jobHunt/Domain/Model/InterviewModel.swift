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
}
