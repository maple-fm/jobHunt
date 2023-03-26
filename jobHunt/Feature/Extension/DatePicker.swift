//
//  DatePicker.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/14.
//

import Foundation
import SwiftUI

extension DatePicker {
    func PickerItem() -> some View {
        self
            .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
            .labelsHidden()
            .listRowBackground(Color.clear)
            .colorInvert()
            .colorMultiply(.black)
    }
}
