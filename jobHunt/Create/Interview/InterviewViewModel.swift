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
    private var model = InterviewModel()

    @Published var name = "" {
        didSet {
            model.name = name
        }
    }

    @Published var deadline = Date.now {
        didSet {
            model.deadline = deadline
        }
    }

    @Published var location = "" {
        didSet {
            model.location = location
        }
    }

    @Published var clothes = "" {
        didSet {
            model.clothes = clothes
        }
    }

    @Published var motivation = "" {
        didSet {
            model.motivation = motivation
        }
    }
    @Published var gakuchika = "" {
        didSet {
            model.gakuchika = gakuchika
        }
    }
    @Published var strongPoints = "" {
        didSet {
            model.strongPoints = strongPoints
        }
    }
    @Published var weakPoints = "" {
        didSet {
            model.weakPoints = weakPoints
        }
    }

    @Published var questions = "" {
        didSet {
            model.questions = questions
        }
    }

    @Published var other = "" {
        didSet {
            model.other = other
        }
    }

    func isValidated() -> Bool {
        model.isValidated()
    }

    func clickButton(click: Bool) {
        model.create()
    }


}
