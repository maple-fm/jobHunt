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
    var category: EventName { get }
}

enum EventName: String, CaseIterable, PersistableEnum {
    case es = "エントリーシート"
    case interview = "面接/面談"
    case session = "説明会"
    case internship = "インターンシップ"
}

extension EventName {
    var baseColor: Color {
        switch self {
        case .es : return Color(UIColor(176, 245, 188, 100).cgColor)
        case .interview : return Color(UIColor(255, 246, 167, 100).cgColor)
        case .session: return Color(UIColor(189, 250, 255, 100).cgColor)
        case .internship: return Color(UIColor(255, 158, 151, 100).cgColor)
        }
    }

    var bgColor: Color {
        switch self {
        case .es : return Color(UIColor(174, 223, 149, 100).cgColor)
        case .interview : return Color(UIColor(226, 232, 151, 100).cgColor)
        case .session: return Color(UIColor(172, 208, 232, 100).cgColor)
        case .internship: return Color(UIColor(255, 177, 150, 100).cgColor)
        }
    }
}

