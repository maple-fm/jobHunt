//
//  EditViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation

class EditViewModel: ObservableObject {

    private var repository = EventRepository()

    @Published var name: String = ""
    @Published var deadline: Date = .now
    @Published var location: String = ""
    @Published var clothes: String = ""
    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var item: String = ""
    @Published var questions: String = ""
    @Published var other: String = ""

    func clickUpdateOfES(id: String) {
        repository.editES(
            id: id,
            name: self.name,
            deadline: self.deadline,
            motivation: self.motivation,
            gakuchika: self.gakuchika,
            strongPoints: self.strongPoints,
            weakPoints: self.weakPoints,
            other: self.other
        )
    }

    func clickUpdateOfInterview(id: String) {
        repository.editInterview(
            id: id,
            name: self.name,
            deadline: self.deadline,
            location: self.location,
            clothes: self.clothes,
            motivation: self.motivation,
            gakuchika: self.gakuchika,
            strongPoints: self.strongPoints,
            weakPoints: self.weakPoints,
            questions: self.questions,
            other: self.other
        )
    }

    func clickUpdateOfInternship(id: String) {
        repository.editInternship(
            id: id,
            name: self.name,
            deadline: self.deadline,
            location: self.location,
            clothes: self.clothes,
            item: self.item,
            other: self.other
        )
    }

    func clickUpdateOfSession(id: String) {
        repository.editSession(
            id: id,
            name: self.name,
            deadline: self.deadline,
            location: self.location,
            clothes: self.clothes,
            item: self.item,
            questions: self.questions,
            other: self.other
        )
    }

}
