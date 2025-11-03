//
//  ESModel.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/10/16.
//

import Foundation
import FirebaseFirestore

// エントリーシート
struct ESModel: Entry {

    var id: String             // Firestore 用 ID
    var realmId: String?       // 元 Realm ID を保持
    var name: String
    var eventTime: Date
    var endTime: Date?
    var motivation: String?
    var gakuchika: String?
    var strongPoints: String?
    var weakPoints: String?
    var other: String?
    var category: EventName
    
    init(
        id: String = UUID().uuidString,
        realmId: String? = nil,
        name: String,
        start eventTime: Date,
        motivation: String? = nil,
        gakuchika: String? = nil,
        strongPoints: String? = nil,
        weakPoints: String? = nil,
        other: String? = nil,
        category: EventName
    ) {
        self.id = id
        self.realmId = realmId
        self.name = name
        self.eventTime = eventTime
        self.motivation = motivation
        self.gakuchika = gakuchika
        self.strongPoints = strongPoints
        self.weakPoints = weakPoints
        self.other = other
        self.category = category
    }
    
    // Firestore 用変換
    func toFirestore() -> [String: Any] {
        return [
            "id": id,
            "realmId": realmId as Any,
            "name": name,
            "eventTime": eventTime,
            "motivation": motivation ?? "",
            "gakuchika": gakuchika ?? "",
            "strongPoints": strongPoints ?? "",
            "weakPoints": weakPoints ?? "",
            "other": other ?? "",
            "category": category.rawValue
        ]
    }
    
    // Firestore から生成
    static func fromFirestore(data: [String: Any]) -> ESModel? {
        guard
            let id = data["id"] as? String,
            let name = data["name"] as? String,
            let timestamp = data["eventTime"] as? Timestamp,
            let categoryRaw = data["category"] as? String,
            let category = EventName(rawValue: categoryRaw)
        else { return nil }
        
        return ESModel(
            id: id,
            realmId: data["realmId"] as? String,
            name: name,
            start: timestamp.dateValue(),
            motivation: data["motivation"] as? String,
            gakuchika: data["gakuchika"] as? String,
            strongPoints: data["strongPoints"] as? String,
            weakPoints: data["weakPoints"] as? String,
            other: data["other"] as? String,
            category: category
        )
    }
}
