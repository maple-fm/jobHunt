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
    private var repository = InterviewRepository()
    private var createRepository = CreateRepository()

    @State var name: String = ""
    @State var deadline: Date = Date.now
    @State var location: String = ""
    @State var clothes: String = ""
    @State var motivation: String = ""
    @State var gakuchika: String = ""
    @State var strongPoints: String = ""
    @State var weakPoints: String = ""
    @State var questions: String = ""
    @State var other: String = ""

    func isValidated() -> Bool {
        createRepository.isValidated(name: name)
    }

    func clickButton(click: Bool) {
        repository.saveNesInterview(
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
