//
//  CreateViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2023/03/13.
//

import Foundation
import Combine
import SwiftUI

class CreateViewModel: ObservableObject {

    private var eventReprository = EventRepository()
    private var createRepository = CreateRepository()

    @Published var name: String = ""
    @Published var flow: Flow = .first
    @Published var location: String = ""
    @Published var clothes: String = ""
    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var item: String = ""
    @Published var questions: String = ""
    @Published var other: String = ""

    func isValidated() -> Bool {
        createRepository.isValidated(name: name)
    }

    func clickButton(event: EventName, click: Bool, start eventTime: Date, end endTime: Date? = nil) {
        switch event {
        case .es:
            eventReprository.saveNewES(
                name: name,
                start: eventTime,
                motivation: motivation,
                gakuchika: gakuchika,
                strongPoints: strongPoints,
                weakPoints: weakPoints,
                other: other,
                category: .es)

        case .interview:
            
            guard let endTime = endTime else { return }
            
            eventReprository.saveInterview(
                name: name,
                start: eventTime,
                end: endTime,
                flow: flow,
                location: location,
                clothes: clothes,
                motivation: motivation,
                gakuchika: gakuchika,
                strongPoints: strongPoints,
                weakPoints: weakPoints,
                questions: questions,
                other: other,
                category: .interview)

        case .session:
            eventReprository.saveNewSession(
                name: name,
                start: eventTime,
                location: location,
                clothes: clothes,
                item: item,
                questions: questions,
                other: other,
                category: .session)
            
        case .internship:
            eventReprository.saveNewInternship(
                name: name,
                start: eventTime,
                location: location,
                clothes: clothes,
                item: item,
                other: other,
                category: .internship)
        }
    }
}
