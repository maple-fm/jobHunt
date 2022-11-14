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

    func TextArea(category: EventName) -> some View {
        self
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.black)
            .background(bgColor(category: category))
            .cornerRadius(14)
    }

    func bgColor(category: EventName) -> Color {
        switch category {
        case .es : return Color(UIColor(red: 0.75, green: 0.889, blue: 0.75, alpha: 1).cgColor)
        case .interview : return Color(UIColor(red: 1, green: 0.962, blue: 0.733, alpha: 0.5).cgColor)
        case .session: return Color(UIColor(red: 0.69, green: 0.962, blue: 1, alpha: 1).cgColor)
        case .internship: return Color(UIColor(red: 1, green: 0.9, blue: 1, alpha: 1).cgColor)
        }
    }
}
