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
    private var createRepository = CreateRepository()

    @Published var name: String = ""
    @Published var deadline: Date = Date.now
    @Published var location: String = ""
    @Published var clothes: String = ""
    @Published var item: String = ""
    @Published var other: String = ""

    func isValidated() -> Bool {
        createRepository.isValidated(name: name)
    }

    func clickButton(click: Bool) {
        repository.saveNewInternship(
            name: name,
            deadline: deadline,
            location: location,
            clothes: clothes,
            item: item,
            other: other,
            category: .internship)
    }


}
