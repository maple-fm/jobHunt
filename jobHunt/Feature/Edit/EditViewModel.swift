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
    @Published var location: String = ""
    @Published var clothes: String = ""
    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var other: String = ""

    func clickUpdateofES(id: String) {
        repository.editES(
            id: id,
            name: self.name,
            motivation: self.motivation,
            gakuchika: self.gakuchika,
            strongPoints: self.strongPoints,
            weakPoints: self.weakPoints,
            other: other
        )
    }

    func clickUpdateofInterview(id: String) {
        repository.editInterview(
            id: id,
            name: self.name,
            location: self.location,
            clothes: self.clothes,
            motivation: self.motivation,
            gakuchika: self.gakuchika,
            strongPoints: self.strongPoints,
            weakPoints: self.weakPoints,
            other: other
        )
    }

}
