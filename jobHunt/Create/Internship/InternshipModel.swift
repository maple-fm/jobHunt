//
//  InternshipModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation

struct InternshipModel {

    var name: String?
    var deadline: Date?
    var location: String?
    var clothes: String?
    var item: String?
    var other: String?

    init(name: String? = nil, deadline: Date? = nil, location: String? = nil, clothes: String? = nil, item: String? = nil, other: String? = nil) {
        self.name = name
        self.deadline = deadline
        self.location = location
        self.clothes = clothes
        self.item = item
        self.other = other
    }

    func create() {
        print("Internship")
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
