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
            .background(Color(UIColor(red: 0.922, green: 1, blue: 0.921, alpha: 1).cgColor))
            .listRowBackground(Color.clear)
    }
}
