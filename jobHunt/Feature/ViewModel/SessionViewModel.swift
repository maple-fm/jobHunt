//
//  SessionViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import Combine
import SwiftUI

class SessionViewModel: ObservableObject {
    private var repository = SessionRepository()
    private var createRepository = CreateRepository()

    @State var name: String = ""
    @State var deadline: Date = Date.now
    @State var location: String = ""
    @State var clothes: String = ""
    @State var item: String = ""
    @State var questions: String = ""
    @State var other: String = ""

    func isValidated() -> Bool {
        createRepository.isValidated(name: name)
    }

    func clickButton(click: Bool) {
        repository.saveNewSession(
            name: name,
            deadline: deadline,
            location: location,
            clothes: clothes,
            item: item,
            questions: questions,
            other: other,
            category: .internship)
    }


}
