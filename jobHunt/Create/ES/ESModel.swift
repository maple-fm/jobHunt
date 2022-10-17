//
//  ESModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation

struct ESModel {

    var name: String?
    var deadline: Date?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?

    mutating func create() {
        print("ES")
        print(self.name ?? "名無し")
    }
}
