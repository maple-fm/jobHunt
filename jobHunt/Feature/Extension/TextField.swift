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
            .listRowBackground(Color(UIColor(red: 0, green: 0.35, blue: 0.1, alpha: 0.1).cgColor))
    }


}

extension TextEditor {
    func input() -> some View {
        self
            .listRowBackground(Color(UIColor(red: 0, green: 0.35, blue: 0.1, alpha: 0.1).cgColor))
    }

    func textArea() -> some View {
        self
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            .background(Color(UIColor(red: 0.75, green: 0.889, blue: 0.75, alpha: 1).cgColor))
            .cornerRadius(14)
            .scrollContentBackground(Visibility.hidden)

    }
}
