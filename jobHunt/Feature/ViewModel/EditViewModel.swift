//
//  EditViewModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation

class EditViewModel: ObservableObject {

    @Published var motivation: String = ""
    @Published var gakuchika: String = ""
    @Published var strongPoint: String = ""
    @Published var weakPoints: String = ""
    @Published var other: String = ""
}
