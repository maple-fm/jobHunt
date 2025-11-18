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
    // 企業名
    var name: String { get set }
    // 開始時間
    var eventTime: Date { get }
    // 終了時間
    var endTime: Date? { get }
    // カテゴリ
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
        case .es : return Color(UIColor(named: "Es")!.cgColor)
        case .interview : return Color(UIColor(named: "Interview")!.cgColor)
        case .session: return Color(UIColor(named: "Session")!.cgColor)
        case .internship: return Color(UIColor(named: "Intern")!.cgColor)
        }
    }
}

