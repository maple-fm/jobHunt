//
//  TextField.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import SwiftUI

extension TextField {
    func input() -> some View {
        self
            .listRowBackground(Color(UIColor(named: "form")!.cgColor))
            .foregroundColor(.black)
    }
}

extension TextEditor {

    func input() -> some View {
        self
            .listRowBackground(Color(UIColor(named: "form")!.cgColor))
            .foregroundColor(.black)
    }

    func textArea(_ category: EventName) -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity, minHeight: 70, alignment: .leading)
            .foregroundColor(.black)
            .background(Color(UIColor(named: "form")!.cgColor))
            .cornerRadius(14)
            .scrollContentBackground(Visibility.hidden)

    }
}
