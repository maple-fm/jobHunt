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
            SectionTitle(title: title)
            Text(value)
                .TextArea(category)
        }
    }
    
    func sectionView(title: String, value: String, category: EventName) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Section(
                header: SectionTitle(title: title),
                footer: Text("\(value.count)count")
                    .footer()
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .padding(.bottom, 5)
            ) {
                Text(value)
                    .TextArea(category)
            }
        }
    }
}
