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

    @Published var name = "" {
        didSet {
            repository.model.name = name
        }
    }

    @Published var deadline = Date.now {
        didSet {
            repository.model.deadline = deadline
        }
    }

    @Published var location = "" {
        didSet {
            repository.model.location = location
        }
    }

    @Published var clothes = "" {
        didSet {
            repository.model.clothes = clothes
        }
    }

    @Published var motivation = "" {
        didSet {
            repository.model.motivation = motivation
        }
    }
    @Published var gakuchika = "" {
        didSet {
            repository.model.gakuchika = gakuchika
        }
    }
    @Published var strongPoints = "" {
        didSet {
            repository.model.strongPoints = strongPoints
        }
    }
    @Published var weakPoints = "" {
        didSet {
            repository.model.weakPoints = weakPoints
        }
    }

    @Published var questions = "" {
        didSet {
            repository.model.questions = questions
        }
    }

    @Published var other = "" {
        didSet {
            repository.model.other = other
        }
    }

    func isValidated() -> Bool {
        repository.isValidated()
    }

    func clickButton(click: Bool) {
        repository.create()
    }


}
