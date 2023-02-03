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
            .padding(.leading, -10)
            .labelsHidden()
            .listRowBackground(Color.clear)
    }
}
