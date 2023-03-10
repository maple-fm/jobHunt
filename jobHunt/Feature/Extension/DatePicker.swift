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
            .frame(width: 135, height: 50)
            .labelsHidden()
            .listRowBackground(Color.clear)
            .colorInvert()
            .colorMultiply(.black)
    }
}
