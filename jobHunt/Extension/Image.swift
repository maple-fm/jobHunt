//
//  Image.swift
//  jobCalendar (iOS)
//
//  Created by 出口楓真 on 2022/09/04.
//

import Foundation
import SwiftUI

extension Image {
    func ImageItem() -> some View {
        self
            .font(.system(size: 60))
            .frame(width: 60, height: 60, alignment: .center)
            .foregroundColor(.green)
    }
}
