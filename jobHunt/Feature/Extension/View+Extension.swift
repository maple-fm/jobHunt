//
//  View+Extension.swift
//  jobHunt
//
//  Created by 出口楓真 on 2023/06/28.
//

import Foundation
import SwiftUI

extension View {
    func textView(title: String, value: String, category: EventName) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .sectionTitle()
            Text(value)
                .TextArea(category)
        }
    }
}
