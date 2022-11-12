//
//  InternshipViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/18.
//

import Foundation
import Combine
import SwiftUI

class InternshipViewModel: ObservableObject {
    private var repository = InternshipRepository()

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
    @Published var item = "" {
        didSet {
            repository.model.item = item
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
