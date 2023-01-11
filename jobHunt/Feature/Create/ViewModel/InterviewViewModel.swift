//
//  InterviewViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import Combine
import SwiftUI

class InterviewViewModel: ObservableObject {

    private var eventReprository = EventRepository()
    private var createRepository = CreateRepository()

    @Published var name: String = ""
    @Published var deadline: Date
    @Published var location: String = ""
    @Published var clothes: String = ""
    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var questions: String = ""
    @Published var other: String = ""

    init(deadline: Date) {
        self.deadline = deadline
    }

    func isValidated() -> Bool {
        createRepository.isValidated(name: name)
    }

    func clickButton(click: Bool) {
        eventReprository.saveNesInterview(
            name: name,
            deadline: deadline,
            location: location,
            clothes: clothes,
            motivation: motivation,
            gakuchika: gakuchika,
            strongPoints: strongPoints,
            weakPoints: weakPoints,
            questions: questions,
            other: other,
            category: .interview)
    }


}
