//
//  Event.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/10.
//

import Foundation
import RealmSwift

protocol Entry {
    var id: UUID { get }
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

