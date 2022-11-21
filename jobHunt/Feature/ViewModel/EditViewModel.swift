//
//  EditViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation

class EditViewModel: ObservableObject {

    private var repository = EventRepository()

    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoints: String = ""
    @Published var weakPoints: String = ""
    @Published var other: String = ""

    func clickUpdate() {
        
    }
}
