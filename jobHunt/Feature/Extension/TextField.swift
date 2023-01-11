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
            .listRowBackground(CustomColor().inputColor())
    }
}

extension TextEditor {

    func input() -> some View {
        self
            .listRowBackground(CustomColor().inputColor())
    }

    func textArea(_ category: EventName) -> some View {
        self
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            .background(CustomColor().bgColor(category))
            .cornerRadius(14)
            .scrollContentBackground(Visibility.hidden)

    }
}
