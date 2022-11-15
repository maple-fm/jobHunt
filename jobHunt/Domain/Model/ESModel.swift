//
//  ESModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation

struct ESModel: Entry {

    var id: String
    var name: String
    var deadline: Date
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?
    var category: EventName

}
