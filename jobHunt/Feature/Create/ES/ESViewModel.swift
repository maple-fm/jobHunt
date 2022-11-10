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
    private var repository = ESRepository()

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

    @Published var other = "" {
        didSet {
            repository.model.other = other
        }
    }


    func isValidated() -> Bool {
        // 一行の時はreturnは省略できる
        repository.isValidated()
    }


    func clickButton(click: Bool) {
        repository.create()
    }


}
