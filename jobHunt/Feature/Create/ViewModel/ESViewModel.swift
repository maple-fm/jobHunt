//
//  ESViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation
import Combine
import SwiftUI

class ESViewModel: ObservableObject {

    private var eventReprository = EventRepository()
    private var createRepository = CreateRepository()

    @Published var name: String = ""
    @Published var deadline: Date = Date.now
    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var other: String = ""


    func isValidated() -> Bool {
        createRepository.isValidated(name: name)
    }


    func clickButton(click: Bool) {
        eventReprository.saveNewES(
            name: name,
            deadline: deadline,
            motivation: motivation,
            gakuchika: gakuchika,
            strongPoints: strongPoints,
            weakPoints: weakPoints,
            other: other,
            category: .es)
    }


}
