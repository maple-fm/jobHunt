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
            .listRowBackground(Color.white)
    }


}

extension TextEditor {
    func input() -> some View {
        self
            .listRowBackground(Color.white)
    }

    func textArea() -> some View {
        self
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(14)
    }
}
