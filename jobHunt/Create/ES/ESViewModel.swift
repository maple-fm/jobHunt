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
    private var model = ESModel()

    @Published var name = "" {
        didSet {
            model.name = name
            print(model.name)
        }
    }

    @Published var deadline = Date.now {
        didSet {
            model.deadline = deadline
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

    @Published var other = "" {
        didSet {
            model.other = other
        }
    }

    @Published private(set) var canCreate = false

    func isValidated() -> Bool {
        model.isValidated()
    }


    func clickButton(click: Bool) {
//        print(self.name != "" ? self.name : "x")
        model.create()
    }


}
