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

    @State var name: String = ""
    @State var deadline: Date = Date.now
    @State var location: String = ""
    @State var clothes: String = ""
    @State var item: String = ""
    @State var other: String = ""

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
