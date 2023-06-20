//
//  Event.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift
import SwiftUI

protocol Entry: Identifiable {

    var id: String { get }
    var name: String { get }
    var deadline: Date { get }
    var endDeadline: Date? { get }
    var category: EventName { get }
}

enum EventName: String, CaseIterable, PersistableEnum {
    case es = "エントリーシート"
    case interview = "面接/面談"
    case session = "説明会"
    case internship = "インターンシップ"
}

extension EventName {

    var bgColor: Color {
        switch self {
        case .es : return Color(UIColor(named: "esBg")!.cgColor)
        case .interview : return Color(UIColor(named: "interviewBg")!.cgColor)
        case .session: return Color(UIColor(named: "sessionBg")!.cgColor)
        case .internship: return Color(UIColor(named: "internBg")!.cgColor)
        }
    }
}

