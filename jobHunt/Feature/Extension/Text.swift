//
//  Text.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//
import Foundation
import SwiftUI

extension Text {
    func sectionTitle() -> some View {
        self
            .font(.system(size: 18))
            .foregroundColor(.black)
            .padding(.top, 10)
    }

    func TextArea(_ category: EventName) -> some View {
        self
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(maxWidth: .infinity, minHeight: 20, alignment: .leading)
            .foregroundColor(.black)
            .background(Color(UIColor(named: "form")!.cgColor))
            .cornerRadius(14)
    }

    func footer() -> some View {
        self
            .position(x: UIScreen.main.bounds.width - 100, y:5)
            .foregroundColor(.black)

    }
}
