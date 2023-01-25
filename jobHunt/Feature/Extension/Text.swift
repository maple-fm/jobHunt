//
//  Text.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//
import Foundation
import SwiftUI

extension Text {
    func headetTitle() -> some View {
        self
            .font(.title)
            .foregroundColor(.black)
            .padding(.bottom, 5)
    }

    func TextArea(_ category: EventName) -> some View {
        self
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            .background(category.baseColor)
            .cornerRadius(14)
    }
}
