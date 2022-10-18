//
//  ESModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation
import Combine

struct ESModel {

    var name: String?
    var deadline: Date?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?


    init(name: String? = nil, deadline: Date? = nil, motivation: String? = nil, gakuchika: String? = nil, strongPoints: String? = nil, weakPoints: String? = nil, other: String? = nil) {
        self.name = name
        self.deadline = deadline
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.other = other
    }

    func create() {
        print("ES")
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
