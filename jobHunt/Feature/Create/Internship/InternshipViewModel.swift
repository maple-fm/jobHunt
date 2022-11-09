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
    private var model = InternshipModel()

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
    @Published var item = "" {
        didSet {
            model.item = item
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
